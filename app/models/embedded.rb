class Embedded < ApplicationRecord
  belongs_to :user
  has_one :track, as: :media

  ####################
  # SETUP: SOURCES,
  # LINK CHECK
  ####################

  # Regex patterns for supported service links
  VALID_VIMEO_FORMAT = /^[https?:\/\/vimeo\.com\/]+([^#\&\?\/]*)/i
      # https://vimeo.com/209507887
  VALID_YOUTUBE_FORMAT = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
      # https://www.youtube.com/watch?v=8KkW8Ul7Q1I
      # https://youtu.be/8KkW8Ul7Q1I?t=1m
  VALID_BANDCAMP_FORMAT = /^[https?:\/\/]+([a-z]+)\.bandcamp\.com\/track\/([^#\&\?\/]*)/i
      # https://ARTIST.bandcamp.com/track/TITLE
  VALID_SOUNDCLOUD_FORMAT = /^[https?:\/\/\soundcloud\.com]+\/([^#\&\?\/]*)\/([^#\&\?\/]*)/
      # https://soundcloud.com/ARTIST/TITLE
  VALID_SPOTIFY_FORMAT = /^(spotify:track:|https?:\/\/[a-z]+\.spotify\.com\/track\/)([^#\&\?\/]*)/i
      # spotify:track:2TpxZ7JUBn3uw46aR7qd6V
      # http://open.spotify.com/track/2TpxZ7JUBn3uw46aR7qd6V (or https)

  before_validation :source_path, presence: true
  before_validation :check_embed_source

  def set_parameters(url)
  end

  def get_data
  end

  def auto_metadata
  end

  def player_url
  end

  def check_embed_source
    supported_sources = [VALID_VIMEO_FORMAT, VALID_YOUTUBE_FORMAT, VALID_BANDCAMP_FORMAT, VALID_SOUNDCLOUD_FORMAT, VALID_SPOTIFY_FORMAT]
    source_service = supported_sources.detect { |svc| source_path.validate(svc) }
    if !source_service.nil?
      svc = source_service.match(/(?<=VALID_).*?(?=_FORMAT)/).captures[0].safe_constantize
    @media = svc.new
    end
  end

end
