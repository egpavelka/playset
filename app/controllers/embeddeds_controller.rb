class EmbeddedsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update, :destroy]
  require 'httparty'

  def new
    @embedded = Embedded.new
  end

  def create
    # Check source_path for appropriate service and create a corresponding object to generate player_url and query track data.
    @embedded = Embedded.new(embedded_params)
    if @embedded.save
    else

    end
  end

  ####################
  # EMBED SOURCES:
  # PARSE SOURCE_PATH,
  # CREATE API_URL and IFRAME_URL
  ####################

  def vimeo
    # API parameters from input url
    video_id = self.source_path.match(VALID_VIMEO_FORMAT).captures[0]
    # API url structure with parameters
    api_url = ""
    response = api_call(api_url)
    self.auto_metadata = {
      :title => '',
      :artist => '',
      :album => '',
      :year => '',
      'album_art_url' =>''
    }
    # Generate url with options for iframe
    self.player_url = "https://player.vimeo.com/video/#{video_id}?color=ffffff&title=0&byline=0&portrait=0"
  end

  def youtube
    YOUTUBE_API_KEY = 'AIzaSyD_-CYPWp2DgQ6VeEqPpZtCgQksSWaUU14'
    # API parameters from input url
    video_id = self.source_path.match.(VALID_YT_FORMAT).captures[1]
      # First match group will be 'watch?v=' or '&v='
      # Second match group will be video ID
      # API url structure with parameters
      api_url = ""
      response = api_call(api_url)
      self.auto_metadata = {
        :title => '',
        :artist => '',
        :album => '',
        :year => '',
        'album_art_url' =>''
      }
      # Generate url with options for iframe
      self.player_url = ""
  end

  def bandcamp
    # API parameters from input url
    artist_path = self.source_path.match.(VALID_BANDCAMP_FORMAT).captures[0]
    title_path = self.source_path.match.(VALID_BANDCAMP_FORMAT).captures[1]
    # API url structure with parameters
    api_url = ""
    response = api_call(api_url)
    self.auto_metadata = {
      :title => '',
      :artist => '',
      :album => '',
      :year => '',
      'album_art_url' =>''
    }
    # Generate url with options for iframe
    self.player_url = ""
  end

  def soundcloud
    SOUNDCLOUD_CLIENT_ID = ''
    # Unique parameters from input url (may not need)
    # artist_path = self.source_path.match.(VALID_SOUNDCLOUD_FORMAT).captures[0]
    # title_path = self.source_path.match.(VALID_SOUNDCLOUD_FORMAT).captures[1]
    # API url structure to get track_id
    init_api_url = "https://api.soundcloud.com/resolve.json?url=#{self.source_path}&client_id=#{SOUNDCLOUD_CLIENT_ID}"
    # This will return JSON { 'status': '...', 'location': "https://api.soundcloud.com/tracks/#{track_id}.json?client_id=#{SOUNDCLOUD_CLIENT_ID}"}
    api_url = api_call(init_api_url).values[1]["location"]
    # Make new call to "location" url from init_api_url response
    response = api_call(api_url).values[1]
    self.auto_metadata = {
      :title => response["title"],
      :artist => response["username"],
      :album => response["release"],
      :year => response["release_year"],
      'album_art_url' => response["artwork_url"]
    }
    # Generate url with options for iframe
    self.player_url = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/#{track_id}&amp;color=333333&amp;auto_play=false&amp;hide_related=true&amp;show_comments=false&amp;show_user=false&amp;show_reposts=false"
  end

  def spotify
    SPOTIFY_CLIENT_ID = '05343128829c43e19407fc13849136c8'
    # API parameters from input url
    track_id = source_path.match.(VALID_SPOTIFY_FORMAT).captures[1]
      # (first match group is type (uri vs url), second is track id)
    # API url structure with parameters
    api_url = "https://api.spotify.com/v1/tracks/#{track_id}"
    response = api_call(api_url)
    self.auto_metadata = {
      :title => response["name"],
      :artist => response.values["artists"][0]["name"],
      :album => response["album"]["name"],
      :year => '',
      'album_art_url' => response["album"]["images"][0]["url"]
    }
    # Generate url with options for iframe
    self.player_url = ""
  end

  private

  def embedded_params
    params.require(:embedded).permit(:source_path, :player_url, :auto_metadata)
  end

  # Check that source_path is in a valid format for a supported service and initialize variables for that service.

  def api_call(url)
    response = HTTParty.get(url)
    response.parsed_response
 end


end
