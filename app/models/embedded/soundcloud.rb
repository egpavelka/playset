require 'soundcloud'

class Embedded::Soundcloud
  include DataGrabUtil
  # include CapybaraUtil

  def get_data(url)
    # Acceptable url example
    # https://soundcloud.com/theacid/the-acid-tumbling-lights
    data = call_and_catch_errors('/resolve', url: url)
    # embed_data = call_and_catch_errors('/oembed', :url => url)
    # data['artwork_url'] = embed_data.thumbnail_url
    page = read_page(url)
    data['artwork_url'] = page.at_xpath("//meta[@property='og:image']").attributes['content'].value
    data
  end

  def set_metadata(data)
    puts data.policy == 'SNIP'
    puts data.is_preview?
    Hash[
    :title => data.title,
    :artist => data.user['username'],
    :album => data.release,
    :year => year_from_date(data.release_year, '%Y'),
    :media_path => data.stream_url, # ENDPOINT ONLY! TIME-LIMITED CACHE FOR CALLS TO STREAMING LINKS; GENERATE ON 'PLAY'
    :preview => data.policy == 'SNIP',
    :album_art => file_from_url(data.artwork_url)
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
    return policy == 'SNIP'
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

  # def scrapeAlbumName(url)
  #   full_page = visit_page(url)
  #   albums = find_xpath('//article[@class="sidebarModule g-all-transitions-200-linear soundInSetsModule"]')[0]
  #   if albums.all_text.contains?('In albums')
  #     return
  #   end
  # end

end
