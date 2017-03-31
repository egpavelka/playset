class EmbeddedsController < ApplicationController

  def new
    @embedded = Embedded.new()
  end

end

class BandcampController < EmbeddedsController
  VALID_BANDCAMP_FORMAT = /^[https?:\/\/]+([a-z]+)\.bandcamp\.com\/track\/([^#\&\?\/]*)/i
  # https://pwelverumandsun.bandcamp.com/track/real-death
  # (first match group is band name, second is track)
end

class SoundcloudController < EmbeddedsController
end

class SpotifyController < EmbeddedsController
  VALID_SPOTIFY_FORMAT = /^(spotify:track:|https?:\/\/[a-z]+\.spotify\.com\/track\/)([^#\&\?\/]*)/i

  # spotify:track:2TpxZ7JUBn3uw46aR7qd6V
  # http://open.spotify.com/track/2TpxZ7JUBn3uw46aR7qd6V (or https)
end
