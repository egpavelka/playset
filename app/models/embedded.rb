class Embedded < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_source

  # User enters URL
  validates :url_src, presence: true
  # Assign to service so API can be called
  # validates :api_src, presence: true, inclusion: { in: %w(bandcamp soundclound spotify youtube), message: "%{value} is not a supported service" }

  # Basic check that URLs belong to a supported service and contain the base
  def check_url_src
    # if "bandcamp.com/track/".in? url_src
    #   api_src = 'bandcamp'
    # elsif "soundcloud.com/".in? url_src
    #   api_src = 'soundcloud'
    # elsif "spotify.com/".in? url_src
    #   api_src = 'spotify'
    # elsif "youtube.com/watch?v=".in? url_src
    #   api_src = 'youtube'
    # else
    #   flash[:danger] = title_error
    #   render 'new'
    # end
  end

  title_error = "Please enter a valid link to a single Bandcamp, Soundcloud, or Spotify track or a YouTube video."

  def upload_successful?
  end

end
