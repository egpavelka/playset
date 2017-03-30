class EmbeddedsController < ApplicationController

  def new
    @embedded = Embedded.new()
  end

end

class BandcampController < EmbeddedsController
end

class SoundcloudController < EmbeddedsController
end

class SpotifyController < EmbeddedsController
  # spotify:track:2TpxZ7JUBn3uw46aR7qd6V
  # http://open.spotify.com/track/2TpxZ7JUBn3uw46aR7qd6V
end
