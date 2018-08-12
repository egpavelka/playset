require 'soundcloud'

class SoundcloudService
  include DataGrabUtil
  attr_accessor :url, :data
  # Acceptable url example
  # https://soundcloud.com/theacid/the-acid-tumbling-lights

  def initialize(params)
    @url = params[:url]
    @data = call
  end

  def call
    data = call_and_catch_errors('/resolve', url: @url)
    page = DataGrabUtil.read_page(url)
    data.merge!(
      artwork_url: page.at_xpath("//meta[@property='og:image']")
      .attributes['content'].value,
      hint: { title_hint: page.title, description_hint: data.description }
    )
  end

  def set_metadata
    Hash[
      hint: @data.hint,
      title: @data.title,
      artist: @data.user['username'],
      album: @data.release,
      media_url: @data.stream_url, # ENDPOINT ONLY!
      # TIME-LIMITED CACHE FOR CALLS TO STREAMING LINKS; GENERATE ON 'PLAY'
      year_params: [@data.release_year, '%Y'],
      album_art_params: @data.artwork_url
    ]
  end

  def is_track?
    @data.kind == 'track' && @data.sharing == 'public' && @data.streamable
  end

  def is_preview?
    @data.policy == 'SNIP'
  end

  private

  def private_client
    Soundcloud.new(
      client_id: Rails.application.credentials[:soundcloud_client_id],
      client_secret: Rails.application.credentials[:soundcloud_client_secret]
    )
  end

  def public_client
    Soundcloud.new({
      client_id: Rails.application.credentials[:soundcloud_public_client_id]  })
  end

  def call_and_catch_errors(endpoint, **args)
    clients = [public_client, private_client]
    call_client = clients[0]
    begin
      call_client.get(endpoint, **args)
    rescue Soundcloud::ResponseError => e
      puts "Error: #{e.message}, Status Code: #{e.response.code}"
      return unless call_client == clients[0]
      call_client = clients[1] && retry
    end
  end
end
