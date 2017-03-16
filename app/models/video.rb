class Video < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_source

  # User enters URL
  validates :video_source, presence: true

  def source_is_youtube?
    "youtube.com/watch?v=".in? video_source
  end

end
