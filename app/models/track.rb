class Track < ApplicationRecord
  # USER
  belongs_to :user
  validates :user_id, presence: true

  # STATUS
  validates :status, inclusion: { in: %w(new pending active flagged broken) }

  # METADATA
  validates :kind, inclusion: { in: %w(Embedded Upload Video) }
  validates :title, presence: true
  validates :album, presence: true
  validates :artist, presence: true
  validates :year, length: { is: 4 }

  # MEDIA
  has_many :media_sources
  has_many :uploads, through: :media_sources, source: :media, source_type: 'Upload'
  has_many :embeddeds, through: :media_sources, source: :media, source_type: 'Embedded'
  has_many :videos, through: :media_sources, source: :media, source_type: 'Video'

  # LIKES
  has_and_belongs_to_many :likes #, numericality: true
  # Display (on user profile, main index)
  default_scope -> { order(created_at: :desc) } # on user profile
  # (scope for ordering by likes) # on index - top

end
