class Embedded < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_source
  # Assign to service so API can be called


  # Basic check that URLs belong to a supported service and contain the base
  def new(source_path)
    # valid base URLs for supported services
    embed_kinds = {
      'bandcamp.com/track/' => 'Bandcamp',
      'soundcloud.com' => 'Soundcloud',
      'spotify.com/' => 'Spotify'
    }
    # check if the url belongs to a supported service
    embed_kinds.each { |base, api|
      if "#{base}".in? source_path.to_s
        @media = "#{api}".new(source_path)
      end
    }
    # send to appropriate validation/http get method
    # unless api_source.nil?
    #   check_api_response = "get_from_#{self.api_source.downcase}"
    #   self.check_api_response
    # end
  end

end

class Bandcamp < Embedded
end

class Soundcloud < Embedded
end

class Spotify < Embedded
end
