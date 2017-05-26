class EmbeddedsController < ApplicationController
  # before_action :logged_in_user, only: [:new, :create, :update, :destroy]

  def new
    @embedded = Embedded.new
    @embedded.build_track()
  end

  def create
    # Initialize embedded object belonging to current_user
    @embedded = Embedded.new(embedded_params)
      if @embedded.save
        @track = @embedded.build_track(@embedded.auto_metadata["text_data"])
        # @track.album_art = @track.art_from_url(auto_metadata["album_art_url"])
        @track.save
        if @track.save
          flash[:success] = "Track submitted successfully."
        else
        end
      else
        render 'new'
      end
  end

  ####################
  # EMBED SOURCES:
  # PARSE SOURCE_PATH,
  # CREATE API_URL and IFRAME_URL
  ####################

  private

  def embedded_params
    params.require(:embedded).permit(:source_path, :playback, :player_url, :title, :artist, :album, :year, :album_art)
  end

end
