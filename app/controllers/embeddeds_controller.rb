class EmbeddedsController < ApplicationController
  # before_action :logged_in_user, only: [:new, :create, :update, :destroy]

  def new
    @embedded = Embedded.new
    # @embedded.build_track(user_id: current_user)
  end

  def create
    # Initialize embedded object belonging to current_user
    @embedded = Embedded.new(embedded_params)
      if @embedded.save
        # Check source_path for appropriate service and create a corresponding object to generate player_url and query track data.
        @embedded.build_track(auto_metadata[0])
        flash[:success] = "Track submitted successfully."
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
