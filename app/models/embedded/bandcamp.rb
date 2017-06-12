
class Embedded::Bandcamp
  include JsonUtil

  attr_accessor :embeddeds, :tracks

  def get_data(url)
  # Acceptable URL example
  # https://grabbingclouds.bandcamp.com/track/brewer-street
    page = page_scraper(url)
    data = {
      :title => page.at_xpath("//meta[@property='og:title']").attributes['content'].value,
      :artist => page.at_xpath("//div[@id='name-section']/h3[@class='albumTitle']/span[@itemprop='byArtist']/a").text,
      :album => page.at_xpath("//div[@id='name-section']/h3[@class='albumTitle']/span[@itemprop='inAlbum']/a/span").text,
      :raw_date => page.at_xpath("//meta[@itemprop='datePublished']").attributes['content'].value,
      :album_art_url => page.at_xpath("//div[@id='tralbumArt']/a").attributes['href'].value,
      :raw_player_url => page.at_xpath("//meta[@property='og:video']").attributes['content'].value,
      :kind => page.at_xpath("//meta[@property='og:type']").attributes['content'].value
    }
    return data
  end

  def set_metadata(data)
    # Parameters for player_url
    @track_id = data[:raw_player_url].match(/^*track=([\d]+)\/*/i).captures[0]
    # Hash to return for track_params
    values = [{
      'text_data' => {
      :title => data[:title],
      :artist => data[:artist],
      :album => data[:album],
      :year => year_from_date(data[:raw_date], '%Y%m%d')
      },
      'album_art_url' => data[:album_art_url]
    },
    self.player_url]
    return values
  end

  # Generate url with options for iframe
  def player_url
    "https://bandcamp.com/EmbeddedPlayer/v=2/track=#{@track_id}/size=small/bgcol=ffffff/linkcol=333333/artwork=none/tracklist=false/transparent=true/"
  end

  # Verify
  def is_track?
    data[:kind] == 'song'
  end

end
