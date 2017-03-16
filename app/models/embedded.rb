class Embedded < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_source

  # User enters URL
  validates :url_source, presence: true
  # Assign to service so API can be called
  # validates :api_source, presence: true, inclusion: { in: %w(bandcamp soundclound spotify youtube), message: "%{value} is not a supported service" }

  # Basic check that URLs belong to a supported service and contain the base
  def validate_url_source
    if "bandcamp.com/track/".in? url_source
      puts 'bandcamp'
      # api_source = 'bandcamp'
    elsif "soundcloud.com/".in? url_source
      # api_source = 'soundcloud'
    elsif "spotify.com/".in? url_source
      # api_source = 'spotify'
    else
      flash[:danger] = title_error
      render 'new'
    end
  end

  def self.api_sources
    [Soundcloud, Spotify, Bandcamp]
  end

  def get_info
  end

  title_error = "Please enter a valid link to a single Bandcamp, Soundcloud, or Spotify track or a YouTube video."

end
