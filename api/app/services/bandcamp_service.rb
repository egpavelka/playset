class BandcampService
  include DataGrabUtil
  attr_accessor :url, :base_page, :player_url, :data
  # Acceptable URL example
  # https://grabbingclouds.bandcamp.com/track/brewer-street

  def initialize(params)
    @url = params[:url]
    @data = call
  end

  # Extract media player link from original url,
  def base_call
    @base_page = DataGrabUtil.read_page(@url)
    if @url.include?('/EmbeddedPlayer/v=2')
      @player_url = @url
    else
      @player_url = xpath_meta_property('og:video')
    end
    return scrape_player
  end

  def call
    data = base_call
    # merge with basic data from submitted url
    data.merge(
      hint: {
        title_hint: xpath_meta_property('og:title'),
        description_hint: xpath_meta_property('og:description')
      },
      kind: xpath_meta_property('og:type')
    )
  end

  def set_metadata
    Hash[
      hint: @data[:hint],
      title: @data[:tracks][0][:title],
      artist: @data[:artist],
      album: @data[:album_title],
      media_url: @data[:tracks][0][:file].values.last,
      year_params: [@data[:publish_date], '%d %b %Y'],
      album_art_params: @data[:album_art_lg]
    ]
  end

  # Verify
  def is_track?
    xpath_meta_property('og:type') == 'song'
  end

  def is_preview?
    !@data[:exclusive_show_anywhere].nil?
  end

  # Grab from meta tags in submitted url
  def xpath_meta_property(property)
    @base_page.at_xpath("//meta[@property='#{property}']").attributes['content'].value
  end

  # Open media player url, parse javascript in header for all the media data
  def scrape_player
    var_pattern = /var\splayerdata\s=\s(.*)\;\s*var/i
    track = DataGrabUtil.read_page(@player_url)
    scripts = track.xpath('//head//script')
    content_script = scripts.last.children[0].content.strip
    player_data = content_script.match(var_pattern)[1]
    # swap js for ruby
    player_data.gsub!('null', 'nil')
    eval(player_data)
  end
end
