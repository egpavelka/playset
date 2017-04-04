class EmbeddedsController < ApplicationController

  def new
    @embedded = Embedded.new
  end

  def create
    @embedded = Embedded.new(embedded_params)
    if @embedded.save
    else

    end
  end

end

class BandcampController < EmbeddedsController

  def create
    @embedded = Embedded.new(bandcamp_params)
  end

  private
  def bandcamp_params
    params.require(:bandcamp).permit(:artist, :title)
  end

end

class SoundcloudController < EmbeddedsController

  def create
    @embedded = Embedded.new(soundcloud_params)
  end

  private
  def soundcloud_params
    params.require(:soundcloud_params).permit(:artist, :title)
  end

end

class SpotifyController < EmbeddedsController

    def create
      @embedded = Embedded.new(spotify_params)
    end

    private
    def spotify_params
      params.require(:spotify).permit(:track_id)
    end

end
