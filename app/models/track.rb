class Track < ApplicationRecord
  # Submission: ownership and validation
  belongs_to :user
  validates :user_id, presence: true
  has_many :media_sources
  accepts_nested_attributes_for :media_sources, dependent: :destroy
  has_many :uploads, through: :media_sources, source: :media, source_type: 'Upload'
  has_many :embeddeds, :through :media_sources, source: :media, source_type: 'Embedded'

  # Track metadata
  # validates :title, presence: true
  # validates :album, presence: true
  # validates :artist, presence: true
  # validates :year, length: { is: 4 }
  # Display (on user profile, main index)
  default_scope -> { order(created_at: :desc) } # on user profile
  # (scope for ordering by likes) # on index - top
  has_and_belongs_to_many :likes #, numericality: true

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
