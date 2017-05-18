class EmbeddedsController < ApplicationController

  def new
    @embedded = Embedded.new
  end

  def create
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
    video_id = source_path.match(VALID_SPOTIFY_FORMAT).captures[0]
    # player_url = "https://player.vimeo.com/video/#{video_id}?color=ffffff&title=0&byline=0&portrait=0"
    # API url structure with parameters
    def api_url
    end
  end

  def youtube
    # API parameters from input url
    video_id = source_path.match.(VALID_YT_FORMAT).captures[1]
      # First match group will be 'watch?v=' or '&v='
      # Second match group will be video ID
    # API url structure with parameters
    def api_url
    end
  end

  def bandcamp
    # API parameters from input url
    artist_path = source_path.match.(VALID_BANDCAMP_FORMAT).captures[0]
    title_path = source_path.match.(VALID_BANDCAMP_FORMAT).captures[1]
    # API url structure with parameters
    def api_url
    end
  end

  def soundcloud
    # API parameters from input url
    artist_path = source_path.match.(VALID_SOUNDCLOUD_FORMAT).captures[0]
    title_path = source_path.match.(VALID_SOUNDCLOUD_FORMAT).captures[1]
    # API url structure with parameters
    def api_url
    end
  end

  def spotify
    # API parameters from input url
    track_id = source_path.match.(VALID_SPOTIFY_FORMAT).captures[1]
      # (first match group is type (uri vs url), second is track id)
    # API url structure with parameters
    def api_url
    end
  end

  private

  def embedded_params
    params.require(:embedded).permit(:state, :kind, :playback, :source_path, :title, :artist, :album, :year, :album_art)
  end

end
