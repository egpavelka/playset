class Embedded < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_sources

  VALID_BANDCAMP_FORMAT = /^[https?:\/\/]+([a-z]+)\.bandcamp\.com\/track\/([^#\&\?\/]*)/i
  # https://ARTIST.bandcamp.com/track/TITLE
  # (first match group is artist, second is title)

  VALID_SOUNDCLOUD_FORMAT = /^[https?:\/\/\soundcloud\.com]+\/([^#\&\?\/]*)\/([^#\&\?\/]*)/
  # https://soundcloud.com/ARTIST/TITLE
  # (first match group is artist, second is title)

  VALID_SPOTIFY_FORMAT = /^(spotify:track:|https?:\/\/[a-z]+\.spotify\.com\/track\/)([^#\&\?\/]*)/i
  # spotify:track:2TpxZ7JUBn3uw46aR7qd6V
  # http://open.spotify.com/track/2TpxZ7JUBn3uw46aR7qd6V (or https)
  # (first match group is type (uri vs url), second is track id)

  # Assign to service so API can be called
  def assign_api

  end


end

class Bandcamp < Embedded
end

class Soundcloud < Embedded
end

class Spotify < Embedded
end
