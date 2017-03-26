class Video < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_sources

  attr_accessor :media_source

  VALID_YT_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  YT_API_KEY = 'AIzaSyD_-CYPWp2DgQ6VeEqPpZtCgQksSWaUU14'

  validates :source_path, presence: true, format: YT_LINK_FORMAT

  def source_is_youtube?
    "youtube.com/watch?v=".in? video_source
  end

end
