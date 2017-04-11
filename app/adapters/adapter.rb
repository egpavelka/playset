module Adapters
  require 'httparty'

## VIDEO
  class API < Adapter

    # Structure

    attr_accessor :video, :embedded

    # Call immediately on submission of TrackSubmission::AddSource; validates
    def assign_api(api_list, url)
      api_list.each(|url_format, api|)
      if url_format.match?(url)
        # reference to parent media type (embedded or video)
        api.safe_constantize.new
        # or ditch controllers/models for each api, put all under
      else
        # Error with info on valid link formats for media type
    end

    def parse_source(source_path)
      # Find parameters for API lookup within supplied source path
      #
      # all api calls need:
      # valid_format regex (verify input)
      # list of required uri parameters (with method captures to pull from input)
      # uri structure, build formula
      # call
      # response verification
      # json structure and attributes to pull for metadata and player generation
      # show: build embedded video/song player
    end

  end

  # Specification for instances to be included in respective models

  ## EMBEDDEDS

  class SpotifyApi < API
    CLIENT_ID = '05343128829c43e19407fc13849136c8'
    self.base_url = '-url-'
    self.data_post = track_id
    # data_get
    self.data_save = {
      'title' => data_get.title,
      'artist' => data_get.artist,
      'album' => data_get.album,
      'year' => data_get.year
    }
  end

  ## VIDEOS

  class YouTubeApi < API
    YOUTUBE_API_KEY = 'AIzaSyD_-CYPWp2DgQ6VeEqPpZtCgQksSWaUU14'
    self.base_url = '-url-'
    self.data_post = video_id
    # data_get
  end


end
