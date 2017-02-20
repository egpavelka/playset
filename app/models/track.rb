class Track < ApplicationRecord
  # Submission: ownership and validation
  belongs_to :user
  validates :user_id, presence: true
  # Nested submission types
  validates :src_type, presence: true
  has_one :upload, -> { where :src_type == 'upload' }
  accepts_nested_attributes_for :upload, allow_destroy: true
  has_one :embedded, -> { where :src_type == 'embedded' }
  accepts_nested_attributes_for :embedded, allow_destroy: true
  # Track metadata
  validates :title, presence: true
  validates :album, presence: true
  validates :artist, presence: true
  validates :year, length: { is: 4 }
  # Display (on user profile, main index)
  default_scope -> { order(created_at: :desc) } # on user profile
  # (scope for ordering by likes) # on index - top
  has_and_belongs_to_many :likes #, numericality: true

  def track_loaded?
    # upload_successful? or embed_successful?
  end

end

# -----------[ CLASS DIVIDE ]----------------

class Upload < Track
  belongs_to :track
  validates :file_src, presence: true

  def upload_successful?
  end

end

# -----------[ CLASS DIVIDE ]----------------

class Embedded < Track
  belongs_to :track
  # User enters URL
  validates :url_src, presence: true
  # Assign to service so API can be called
  validates :src_api, presence: true, inclusion: { in: %w(bandcamp soundclound spotify youtube), message: "%{value} is not a supported service" }

  # Basic check that URLs belong to a supported service and contain the base
  def check_url_src
    if "bandcamp.com/track/".in? url_src
      src_api = 'bandcamp'
    elsif "soundcloud.com/".in? url_src
      src_api = 'soundcloud'
    elsif "spotify.com/".in? url_src
      src_api = 'spotify'
    elsif "youtube.com/watch?v=".in? url_src
      src_api = 'youtube'
    else
      flash[:danger] = title_error
      render 'new'
    end
  end

  title_error = "Please enter a valid link to a single Bandcamp, Soundcloud, or Spotify track or a YouTube video."

  def upload_successful?
  end

end
