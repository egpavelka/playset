module Adapters
  require 'net/http'
  require 'json'

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

    # API KEYS
    ## EMBEDDEDS
    SPOTIFY_CLIENT_ID = '05343128829c43e19407fc13849136c8'
    ## VIDEOS
    YT_API_KEY = 'AIzaSyD_-CYPWp2DgQ6VeEqPpZtCgQksSWaUU14'

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

    def build_uri
      # Build url for get
      # url = 'base' + param....
      # To response
      # get_response(URI(url))
    end

    def get_response(uri)
      response = Net::HTTP.get(uri)
      JSON.parse(response)
      # Do something...
    end

  end

  ## EMBEDDED


end
