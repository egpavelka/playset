class TrackSubmissionsController < ApplicationController

  def new
    @submission = TrackSubmission.new
  end

  def create
    @submission = TrackSubmission.new(track_params)
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

end
