class Track < ApplicationRecord
  include Rails.application.routes.url_helpers
  require 'mini_magick'

  # Tracks belong to a user and will be deleted if the account is deactivated.
  belongs_to :user, validate: true

  validates :url, presence: true
  validates :service, inclusion: { in: %w[Bandcamp Spotify Soundcloud Vimeo Youtube] }
  validates :media_type, inclusion: { in: %w[audio video preview] }
  validates :title, length: { maximum: 255 }, presence: true
  validates :artist, length: { maximum: 255 }, presence: true
  validates :album, length: { maximum: 255 }, allow_blank: true
  validates :year, length: { is: 4 }, allow_blank: true

  ## CREATE AND VALIDATE ALBUM ART FROM URL##

  has_one_attached :album_art
  after_create :attach_album_art

  def attach_album_art
    if album_art_origin
      art = MiniMagick::Image.open(album_art_origin) do |a|
        a.resize "800x800"
        a.format "png"
      end

      self.album_art.attach(
        io: File.open(art.path),
        filename: album_art_filename + '.png',
        content_type: art.mime_type)

      self.update(album_art_url: set_album_art_url)
    end
    # else default image?
  end

  private

  def album_art_filename
    t, a = clean_strings([title, artist])
    [id.to_s, t, a].join('_')
  end

  # Remove non-alphanumeric characters from an array of strings so they can safely be used in filenames.
  def clean_strings(arr)
    arr.each { |str| str.gsub(/.\W/, '')}
  end

  def set_album_art_url
    rails_blob_url(album_art) # if album_art.attached?
  end
end
