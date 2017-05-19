class Embedded < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_sources

  attr_accessor :track, :media_sources
  delegate :title, :artist, :album, :year, :album_art, to: :track

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

end
