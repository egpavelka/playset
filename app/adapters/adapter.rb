module Adapters
  require 'net/http'
  require 'json'

## VIDEO
  class API < Adapter

    attr_accessor :video

    def parse_source(source_path)
      # Find parameters for API lookup within supplied source path
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
