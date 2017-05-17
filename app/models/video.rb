class Video < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_sources

  attr_accessor :track
  attr_accessor :media_source

  before_validation :set_video_source

  def set_video_source
    if source_path.validate(VALID_YOUTUBE_FORMAT)
      Video::YouTube.new
    elsif source_path.validates(VALID_VIMEO_FORMAT)
      Video::Vimeo.new
    else
    end
  end

  VALID_VIMEO_FORMAT = /^[https?:\/\/vimeo\.com\/]+([^#\&\?\/]*)/i
  # https://vimeo.com/209507887

  VALID_YOUTUBE_FORMAT = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
  # https://www.youtube.com/watch?v=8KkW8Ul7Q1I
  # https://youtu.be/8KkW8Ul7Q1I?t=1m

end

class YouTube < Video
  validates :track, presence: true
  # API parameters from input url
  def video_id
    source_path.match.(VALID_YT_FORMAT).captures[1]
    # First match group will be 'watch?v=' or '&v='
    # Second match group will be video ID
  end

  # API url structure with parameters
  def api_url
  end

end

class Vimeo < Video

  # API parameters from input url
  def video_id
    source_path.match(VALID_SPOTIFY_FORMAT).captures[0]
  end

  # API url structure with parameters
  def api_url
  end

end
