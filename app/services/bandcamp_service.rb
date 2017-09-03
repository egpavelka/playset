class BandcampService
  include DataGrabUtil

  def get_data(url)
  # Acceptable URL example
  # https://grabbingclouds.bandcamp.com/track/brewer-street
    base_page = read_page(url)
    raw_player_url = base_page.at_xpath("//meta[@property='og:video']").attributes['content'].value
    return scrape_player(raw_player_url)
  end

  def set_metadata(data)
    Hash[
    :title => data[:tracks][0][:title],
    :artist => data[:artist],
    :album => data[:album_title],
    :year => year_from_date(data[:publish_date], '%d %b %Y'),
    :media_path => data[:tracks][0][:file].values.last,
    :album_art => file_from_url(data[:album_art_lg])
    ]
  end

  def scrape_player(player_url)
    var_pattern = /var\splayerdata\s=\s(.*)\;\s*var/i
    track = read_page(player_url)
    scripts = track.xpath("//head//script")
    content_script = scripts.last.children[0].content.strip
    player_data = content_script.match(var_pattern)[1]
    player_data.gsub!('null', 'nil')
    eval(player_data)
  end

  # Verify
  def is_track?
    kind == 'song'
  end

end
