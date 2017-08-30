require 'soundcloud'

class SoundcloudService
  include DataGrabUtil

  def initialize(url)
    @data = self.get_data(url)
  end

  def get_data(url)
    # Acceptable url example
    # https://soundcloud.com/theacid/the-acid-tumbling-lights
    data = call_and_catch_errors('/resolve', url: url)
    page = read_page(url)
    data['artwork_url'] = page.at_xpath("//meta[@property='og:image']").attributes['content'].value
    data
  end

  def set_metadata
    Hash[
    :title => title,
    :artist => user['username'],
    :album => release,
    :year => year_from_date(release_year, '%Y'),
    :media_path => stream_url, # ENDPOINT ONLY! TIME-LIMITED CACHE FOR CALLS TO STREAMING LINKS; GENERATE ON 'PLAY'
    :preview => policy == 'SNIP',
    :album_art => file_from_url(artwork_url)
    ]
  end

  # Verify
  def is_track?
    kind == 'track'
  end

  def is_streamable?
    sharing == 'public' && streamable
  end

  def is_preview?
    policy == 'SNIP'
  end

private

  def private_client
    Soundcloud.new({
      :client_id => Rails.application.secrets.soundcloud_client_id,
      :client_secret => Rails.application.secrets.soundcloud_client_secret })
  end

  def public_client
    Soundcloud.new({
      :client_id => Rails.application.secrets.soundcloud_public_client_id })
  end

  def call_and_catch_errors(endpoint, **args)
     clients = [private_client, public_client]
     call_client = clients[0]
    begin
      call_client.get(endpoint, **args)
    rescue Soundcloud::ResponseError => e
      puts "Error: #{e.message}, Status Code: #{e.response.code}"
      if call_client == clients[0]
        call_client = clients[1]
        retry
      end
    end
  end

end
