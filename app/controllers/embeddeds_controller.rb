class EmbeddedsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update, :destroy]

  def new
    @embed = Embedded.new
    @embed.build_track()
  end

  def create
    # Initialize embedded object belonging to current_user
    @embed = Embedded.new(embedded_params)
      if @embed.save
        # Add current_user to metadata hash (session )
        # should this be @track = current_user.create_track(@embed.auto_metadata...)
        @track = @embed.create_track(@embed.generated_track_params(current_user.id))
        if @track.save
          redirect_to edit_track_path(@track)
        else
          # error would be due to bad player_url
          @embed.destroy
          render 'new'
        end
        EmbeddedsCleanupJob.set(wait: 1.hour).perform_later(@embed)
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
    params.require(:embedded).permit(:source_path, :playback, :user_id)
  end

end
