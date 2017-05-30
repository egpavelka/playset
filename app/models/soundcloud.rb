require_relative 'embedded'
require 'soundcloud'
require 'nokogiri'

class Soundcloud < Embedded
  client_id =  Rails.application.secrets.soundcloud_client_id
  client_secret =  Rails.application.secrets.soundcloud_client_secret

  def get_data(url)
    # Acceptable url example
    # https://soundcloud.com/theacid/the-acid-tumbling-lights
    # API url structure to get track_id
    puts "#{url}"
    api_url = "https://api.soundcloud.com/resolve.json?url=#{url}&client_id=#{self.client_id}"
    # Make new call to "location" url from init_api_url response
    api_call(api_url)
  end

  def get_metadata(data)
    @track_id = data["id"]
    # If artwork_url exists, it's a
    album_art_url = data["artwork_url"]
    album_art_url.gsub!("large.jpg", "t500x500.jpg")
    values = [{
    "text_data" => {
      :title => data["title"],
      :artist => data["user"]["username"],
      :album => data["release"],
      :year => Date.strptime(data["release_year"], '%Y').year
      },
      "album_art_url" => album_art_url
    },
    self.player_url]
    values
  end

  # Generate url with options for iframe
  def player_url
    "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/#{@track_id}&amp;color=333333&amp;auto_play=false&amp;hide_related=true&amp;show_comments=false&amp;show_user=false&amp;show_reposts=false"
  end

  # Special method to check for album name in page since release is nil more often than not
  # def scrape_album_name(url)
  #   page = Nokogiri::HTML(open(url))
  #
  # end

  # Verify
  def matches_link?
  end

  def is_track?
    data["kind"] == 'track'
  end

end
