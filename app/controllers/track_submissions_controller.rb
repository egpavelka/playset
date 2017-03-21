class TrackSubmissionsController < ApplicationController
  # before_action :load_

  def new
    @submission = TrackSubmission.new
    @submission.track = Track.new
  end

  def create
    @submission = TrackSubmission.new(params[:track_submission])
    if @submission.save
      # @track.media = params[:kind].safe_constantize.new
      flash[:success] = "Track posted successfully."
      redirect_to root_path
    else
      flash[:danger] = "Submission had errors."
      render 'new'
    end
  end

  private

  def track_submission_params
    params.require(:track).permit(:status, :kind, :source_path, :title, :artist, :album, :year, media_source_attributes: media_params)
  end

  def media_params
    unless params[:id].nil?
      Track.find(params[:id]).kind.constantize.column_names
    end
  end

end
