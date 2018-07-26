class Track < ApplicationRecord
  # Tracks belong to a user and will be deleted if the account is deactivated.
  belongs_to :user

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
  validates :user_id, presence: true
  validates :submitted_url, presence: true

  validates :source_service, inclusion: { in: %w[bandcamp spotify soundcloud vimeo youtube] }
  validates :media_type, inclusion: { in: %w[audio video preview] }
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

  # SUBMIT submitted_url
  #        -> include current user id or return login/signup form
  #        -> determine if it's a valid url for a supported service
  #        -> if so, create service object to get data from external apis
  # RETURN error (not a valid or supported url) or data from api
  #        -> populate next step in react form (metadata, preview)
  # VERIFY user approves details, new track object is created

  def Track.test_this
    Hash[
      hint: "hello"
    ]
  end

  # def check_url
  #   # check for current user is in front-end logic
  #   # since aggregated tracks will have auto-user
  #   begin
  #     EmbeddingUtil.set_source()
  #   rescue =>
  #         return "There was an error with your submission. Links must be to single tracks (not playlists, channels, or albums) from one of the supported services."
  #   end
  # end
end
