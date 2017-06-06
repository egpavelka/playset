class Track < ApplicationRecord
  # Allow Paperclip to gather album art from URLs.
  require 'open-uri'

### DISPLAY SCOPES
  default_scope -> { order(created_at: :desc) } # on user profile
  # (scope for ordering by likes) # on index - top
  scope :popularity, -> { order(likes: :desc) }
  scope :posted, -> { where(published: true) }
  # scope :audio, posted.where(playback: 'audio')
  # scope :video, posted.where(playback: 'video')

####################
# SETUP: PROPERTIES,
# RELATIONSHIPS
####################
  # Tracks belong to a user and will be deleted if the account is deactivated.
  belongs_to :user
  # Set up
  belongs_to :media, polymorphic: true, dependent: :destroy

####################
# INITIALIZE TRACK:
# USER, SOURCE, MEDIA
####################
  validates :user_id, presence: true
  # validates :playback, inclusion: { in: %w(audio video) }

  # First click to submit should validate the link or file, equip the view, and check for track information via API or metadata.

  # Errors for missing metadata and album art are expected (mostly for uploads and video links), and the redirect will reveal fields for manual entry.

####################
# AFTER MEDIA SOURCE:
# METADATA AND ARTWORK
####################

  # Metadata
  validates :title, presence: true, on: :update
  # validates :album, on: :update
  validates :artist, presence: true, on: :update
  # validates :year, length: { is: 4 }, on: :update, allow_nil: true

  # Album art managed by Paperclip; URL fetching with open-uri
  # has_attached_file :album_art,
  # styles: { medium: {geometry: '400x400>', convert_options: '-colorspace Gray'},
  # large: {geometry: '800x800>', convert_options: '-colorspace Gray'} },
  # url: '/public/assets/images/album_art/:id/:style/:basename.:extension',
  # path: ':rails_root/public/assets/images/album_art/:id/:style/:basename.:extension',
  # default_url: 'assets/album_art/aa_test.jpg',
  # content_type: { content_type: /\Aimage\/.*\z/ },
  # size: { in: 0..100.kilobytes }

  # Fetch from API response or URL input
  def art_from_url(url)
    self.album_art = URI.parse(url)
  end

####################
# FINALIZE SUBMISSION
####################
  # before_action :media_expired?, only: [:edit, :update]
  # before_action :draft_expired?, only: [:edit, :update]
  #
  # def media_exists?
  #   :media_type.safe_constantize.find(params[:media_id])
  # end
  #
  # def check_draft_expiration
  #   media_exists? && created_at < 1.hour.ago && published
  # end
  
####################
# SOCIAL ATTRIBUTES:
# LIKES AND COMMENTS
####################
  # has_and_belongs_to_many :likes, numericality: true
  # Display (on user profile, main index)

end
