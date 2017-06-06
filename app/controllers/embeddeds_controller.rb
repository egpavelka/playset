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
        # assign metadata hash that was populated by API call, add current_user.id
        metadata = @embedded.auto_metadata['text_data']
        metadata['user_id'] = current_user.id
        # use metadata hash as params to create track
        @track = @embedded.create_track(metadata)
        if @track.save
          redirect_to edit_track_path(@track)
        else
          # error would be due to bad player_url
          @embedded.destroy
          render 'new'
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
