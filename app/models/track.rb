class Track < ApplicationRecord
  # Allow Paperclip to gather album art from URLs.
  require 'open-uri'

### DISPLAY SCOPES
  default_scope -> { order(created_at: :desc) } # on user profile
  # (scope for ordering by likes) # on index - top
  scope :popularity, -> { order(likes: :desc) }
  scope :published, -> { where(state: 'published') }
  scope :audio, -> { where(playback: 'audio') }
  scope :video, -> { where(playback: 'video') }

####################
# SETUP: PROPERTIES,
# RELATIONSHIPS
####################
  # Tracks belong to a user and will be deleted if the account is deactivated.
  belongs_to :user, dependent: :destroy
  # Set up
  belongs_to :media, polymorphic: true

####################
# INITIALIZE TRACK:
# USER, SOURCE, MEDIA
####################
  validates :user_id, presence: true
  validates :playback, inclusion: { in: %w(Audio Video) }

  # First click to submit should validate the link or file, equip the view, and check for track information via API or metadata.

  # Errors for missing metadata and album art are expected (mostly for uploads and video links), and the redirect will reveal fields for manual entry.

####################
# AFTER MEDIA SOURCE:
# METADATA AND ARTWORK
####################

  # Metadata
  validates :title, presence: true
  validates :album, presence: true
  validates :artist, presence: true
  validates :year, length: { is: 4 }

  # Album art managed by Paperclip; URL fetching with open-uri
  has_attached_file :album_art,
  styles: { medium: {geometry: '400x400>', convert_options: '-colorspace Gray'},
  large: {geometry: '800x800>', convert_options: '-colorspace Gray'} },
  url: '/public/assets/images/album_art/:id/:style/:basename.:extension',
  path: ':rails_root/public/assets/images/album_art/:id/:style/:basename.:extension',
  default_url: 'assets/album_art/aa_test.jpg',
  content_type: { content_type: /\Aimage\/.*\z/ },
  size: { in: 0..100.kilobytes }

  # Fetch from API response or URL input
  def art_from_url(url)
    self.album_art = URI.parse(url)
  end

####################
# SOCIAL ATTRIBUTES:
# LIKES AND COMMENTS
####################
  has_and_belongs_to_many :likes #, numericality: true
  # Display (on user profile, main index)

end
