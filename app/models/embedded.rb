class Embedded < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_source

  # User enters URL
  validates :url_source, presence: true
  # Assign to service so API can be called


  # Basic check that URLs belong to a supported service and contain the base
  def embed_source_info
    # valid base URLs for supported services
    embed_kinds = {
      'bandcamp.com/track/' => 'Bandcamp',
      'soundcloud.com' => 'Soundcloud',
      'spotify.com/' => 'Spotify'
    }
    # check if the url belongs to a supported service
    embed_kinds.each { |base, api|
      if "#{base}".in? self.url_source.to_s
        self.api_source = "#{api}"
      end
    }
    # send to appropriate validation/http get method
    # unless api_source.nil?
    #   check_api_response = "get_from_#{self.api_source.downcase}"
    #   self.check_api_response
    # end
  end

  def get_from_bandcamp
    puts 'gotcha'
  end

  def get_from_soundcloud
  end

  def get_from_spotify
  end

end
