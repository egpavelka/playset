class Video < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_sources

  attr_accessor :media_source

  VALID_VIMEO_FORMAT = /^[https?:\/\/vimeo\.com\/]+([^#\&\?\/]*)/i
  # https://vimeo.com/209507887

  VALID_YOUTUBE_FORMAT = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
  # https://www.youtube.com/watch?v=8KkW8Ul7Q1I
  # https://youtu.be/8KkW8Ul7Q1I?t=1m

end

class YouTube < Video

  def video_id
    source_path.match.(VALID_YT_FORMAT).captures[1]
    # First match group will be 'watch?v=' or '&v='
    # Second match group will be video ID
  end

end

class Vimeo < Video

  def video_id
    source_path.match(VALID_SPOTIFY_FORMAT).captures[0]
  end

end
