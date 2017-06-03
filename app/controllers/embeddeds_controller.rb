class EmbeddedsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update, :destroy]

  def new
    @embedded = Embedded.new
    @embedded.build_track()
  end

  def create
    # Initialize embedded object belonging to current_user
    @embedded = Embedded.new(embedded_params)
      if @embedded.save
        @track = @embedded.build_track(@embedded.auto_metadata['text_data'])
        @track.save
        if @track.save
          redirect_to edit_track_path(@track)
          flash[:success] = "Track submitted successfully."
        else
          redirect_to new_track_path(@track)
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
    params.require(:embedded).permit(:source_path, :playback, :player_url, :user_id, :title, :artist, :album, :year)
  end

end
