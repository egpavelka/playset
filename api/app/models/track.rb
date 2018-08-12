class Track < ApplicationRecord
  # Tracks belong to a user and will be deleted if the account is deactivated.
  belongs_to :user, validate: true

  has_one_attached :album_art
  # Album art managed by Paperclip; URL fetching with open-uri
  # has_attached_file :album_art,
  #                   styles: { icon: { geometry: '300x300>' },
  #                             large: { geometry: '800x800>',
  #                                      convert_options: '-colorspace Gray' } },
  #                   content_type: { content_type: %r{/\Aimage\/.*\z/} },
  #                   size: { in: 0..1000.kilobytes }

  ####################
  # INITIALIZE TRACK:
  # USER, SOURCE, MEDIA
  ####################
  validates :url, presence: true

  validates :service, inclusion: { in: %w[Bandcamp Spotify Soundcloud Vimeo Youtube] }
  # validates :media_type, inclusion: { in: %w[audio video preview] }
  ####################
  # AFTER MEDIA SOURCE:
  # METADATA AND ARTWORK
  ####################
  # Metadata
  validates :title, length: { maximum: 255 }, presence: true
  validates :artist, length: { maximum: 255 }, presence: true
  validates :album, length: { maximum: 255 }, allow_blank: true
  validates :year, length: { is: 4 }, allow_blank: true
  # validates_attachment :album_art,
  #                      content_type: { content_type: ['image/jpeg',
  #                                                     'image/gif',
  #                                                     'image/png'] }

 end
