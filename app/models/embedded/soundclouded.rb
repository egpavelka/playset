require 'soundcloud'

class Embedded::Soundclouded
  include DataGrabUtil

  def get_data(url)
    # Acceptable url example
    # https://soundcloud.com/theacid/the-acid-tumbling-lights
    data = call_and_catch_errors('/resolve', :url => url)
    embed_data = call_and_catch_errors('/oembed', :url => url)
    data['artwork_url'] = embed_data.thumbnail_url
    data
  end

  def set_metadata(data)
    Hash[
    :title => data.title,
    :artist => data.user['username'],
    :album => data.release,
    :year => year_from_date(data.release_year, '%Y'),
    :media_path => data.stream_url, # ENDPOINT ONLY! TIME-LIMITED CACHE FOR CALLS TO STREAMING LINKS; GENERATE ON 'PLAY'
    :album_art => file_from_url(data.artwork_url)
    ]
  end

  def self.parse_media_stream(stream_url)
    call_and_catch_errors(stream_url, :allow_redirects => true)
  end

  # Verify
  def is_track?
    data.kind == 'track'
  end

  def is_streamable?
    data.sharing == 'public' && data.streamable
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
