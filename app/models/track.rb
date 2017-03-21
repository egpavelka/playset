class Track < ApplicationRecord
  # USER
  belongs_to :user
  validates :user_id, presence: true
  validates :status, inclusion: { in: %w(new pending active flagged broken) }
  validates :kind, inclusion: { in: %w(Embedded Upload Video) }
  validates :source_path, presence: true
  validates :title, presence: true
  validates :album, presence: true
  validates :artist, presence: true
  validates :year, length: { is: 4 }

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

  # def statuses
  #   ['new', 'pending', 'active', 'flagged', 'broken']
  # end

  # Determines whether track is visible
  def active?
    status == 'active'
  end

end
