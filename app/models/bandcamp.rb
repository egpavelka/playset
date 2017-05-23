require_relative 'embedded'

require 'nokogiri'
require 'date'

class Bandcamp < Embedded

  attr_accessor :embeddeds, :tracks

  def get_data(url)
    # API parameters from input url @artist_path = url.match.(VALID_BANDCAMP_FORMAT).captures[0] @title_path = url.match.(VALID_BANDCAMP_FORMAT).captures[1]
    # Watir simulates a new browser instance
    browser = Watir::Browser.new
    # use it to open source_path
    browser.goto(url)
    # Bandcamp's track info is hidden inside a script tag as var TralbumData.  Watir returns the variable as a Ruby hash, which is then returned by this method.
    browser.execute_script('return TralbumData')
  end

  def get_metadata(data)
    # Parameters for player_url
    @track_id = data["id"]
    @album_id = data["current"]["album_id"]
    album_art_url = 'https://f4.bcbits.com/img/a' + data["art_id"].to_s + '_16.jpg'
    # Hash to return for track_params
    values = [{
    :title => data["current"]["title"],
    :artist => data["artist"],
    :album => data["packages"][0]["album_title"],
    :year => Date.strptime(data["album_release_date"], '%d %b %Y').year,
    :album_art => album_art_url
    },
    player_url]
    values
  end

  # Generate url with options for iframe
  def player_url
    "https://bandcamp.com/EmbeddedPlayer/album=#{@album_id}/size=small/bgcol=ffffff/linkcol=333333/artwork=none/track=#{@track_id}/transparent=true/"
  end

  # Verify
  def matches_link?
    data("url") == source_path
  end

  def is_track?
    data("item_type") == 'track'
  end

end
