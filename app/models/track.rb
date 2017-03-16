class Track < ApplicationRecord
  # USER
  belongs_to :user
  validates :user_id, presence: true

  # MEDIA
  has_one :media_source
  accepts_nested_attributes_for :media_source, allow_destroy: true
  has_one :upload, through: :media_source, source: :media, source_type: 'Upload'
  has_one :embedded, through: :media_source, source: :media, source_type: 'Embedded'

  # LIKES
  has_and_belongs_to_many :likes #, numericality: true
  # Display (on user profile, main index)
  default_scope -> { order(created_at: :desc) } # on user profile
  # (scope for ordering by likes) # on index - top

  # Track metadata
  validates :title, presence: true
  validates :album, presence: true
  validates :artist, presence: true
  validates :year, length: { is: 4 }
  validates :kind, presence: true, inclusion: { in: %w(Upload Embedded), message: "%{value} is not a supported service" }

  def self.kinds
    [Upload, Embedded]
  end

  def media
    media_source&.media
  end

  def track_loaded?
    # upload_successful? or embed_successful?
  end

  def has_metadata?
    # autofill, disable form for title/artist/album/year
  end

end

# -----------[ REQUIRE ]----------------
require 'embedded'
require 'upload'
