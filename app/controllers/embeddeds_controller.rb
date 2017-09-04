class EmbeddedsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update, :destroy]

  def new
    @embed = Embedded.new
    @embed.build_track()
  end

  def create
    @embed = Embedded.new(embedded_params)
      if @embed.save
        @track = @embed.create_track(set_track_params)
        if @track.save
          redirect_to edit_track_path(@track)
        else
          flash[:error] = @track.errors.full_messages
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

  def set_track_params
    track_service = set_track_service
    if track_service[:hint]
      flash[:notice] = track_service[:hint][:title_hint]
    end
    return track_service[:metadata]
  end

  def set_track_service
    EmbeddedTrackService.new(@embed).perform
  end

end
