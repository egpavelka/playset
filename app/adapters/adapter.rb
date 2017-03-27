module Adapters
  require 'net/http'
  require 'json'

## VIDEO
  class API < Adapter

    attr_accessor :video, :embedded

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
