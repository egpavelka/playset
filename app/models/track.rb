class Track < ApplicationRecord
  # USER
  belongs_to :user
  validates :user_id, presence: true

  # MEDIA
  has_one :media_source, dependent: :destroy
  has_one :upload, through: :media_source, source: :media, source_type: 'Upload'
  has_one :embedded, through: :media_source, source: :media, source_type: 'Embedded'
  has_one :video, through: :media_source, source: :media, source_type: 'Video'
  accepts_nested_attributes_for :media_source, allow_destroy: true

  # LIKES
  has_and_belongs_to_many :likes #, numericality: true
  # Display (on user profile, main index)
  default_scope -> { order(created_at: :desc) } # on user profile
  # (scope for ordering by likes) # on index - top

  validates :kind, presence: true

  def track_source

    # make sure kind corresponds with file/link source field
    # check that it's a valid member of that class
    # if track_loaded? show metadata fields
    # else
  end

  def track_loaded?
    # upload_successful? or embed_successful? (got api response?)
  end

  def has_metadata?
    # retrieve metadata from embedded sources
    # check mp3 for metadata
    # populate metadata form with retrieved values, disable populated fields
  end

  # Track metadata
  def track_metadata
    validates :title, presence: true
    validates :album, presence: true
    validates :artist, presence: true
    validates :year, length: { is: 4 }
  end

end
