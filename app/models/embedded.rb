class Embedded < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_sources
  # Assign to service so API can be called


  # Basic check that URLs belong to a supported service and contain the base
  def check_source_path(source_path)
    # valid base URLs for supported services
    embed_kinds = {
      'bandcamp.com/track/' => 'Bandcamp',
      'soundcloud.com' => 'Soundcloud',
      'spotify.com/' => 'Spotify'
    }
    # check if the url belongs to a supported service
    embed_kinds.each { |base, api|
      if "#{base}".in? source_path.to_s
        api_source = "#{api}".new(source_path)
      end
    }
    # send to appropriate validation/http get method
    # unless api_source.nil?
    #   check_api_response = "get_from_#{self.api_source.downcase}"
    #   self.check_api_response
    # end
  end

  # def source_path_must_be_supported
  #   if kind == Upload
  #     return
  #   elsif kind == Embedded
  #     media = Embedded.new(media_source.source_path)
  #     unless media.api_source
  #       errors.add(:media_source, "Please supply a link for a song on Spotify, Soundcloud, or Bandcamp.")
  #     end
  #   elsif kind == Video
  #     unless "youtube.com".in?(media_source.source_path)
  #       errors.add(:media_source, "Please supply a valid YouTube URL.")
  #     end
  #   end
  # end

end

class Bandcamp < Embedded
end

class Soundcloud < Embedded
end

class Spotify < Embedded
end
