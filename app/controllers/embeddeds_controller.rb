class EmbeddedsController < ApplicationController

  def new
    @embedded = Embedded.new()
  end

  def create
    @embedded = Embedded.new(embedded_params)
    if @embedded.save
    else

    end
  end

end

class BandcampController < EmbeddedsController
  private
  def bandcamp_params
    params.require(:bandcamp).permit(:artist, :title)
  end
end

class SoundcloudController < EmbeddedsController
  private
  def soundcloud_params
    params.require(:soundcloud).permit(:artist, :title)
  end
end

class SpotifyController < EmbeddedsController
  private
  def spotify_params
    params.require(:spotify).permit(:track_id)
  end
end
