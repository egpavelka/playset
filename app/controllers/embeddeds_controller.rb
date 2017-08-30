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
        @track = EmbeddedTrackService.new(source_path: @embed.source_path, source_service: @embed.source_path)
        if @track.save
          redirect_to edit_track_path(@track)
        else
          flash[:error] = @track.errors
          @embed.destroy
          render 'new'
        end
        EmbeddedsCleanupJob.set(wait: 1.hour).perform_later(@embed)
      else
        flash[:error] = @embed.errors
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
    params.require(:embedded).permit(:source_path, :user_id)
  end

end
