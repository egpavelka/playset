class TracksController < ApplicationController
  # before_action :logged_in_user, only: [:destroy]

  def new
    @track = TrackSubmission.new(submission: [Track.new])
  end

  def create
    @track = Track.new(track_params)
  end

  def show
    @track = Track.find(params[:id]).media_sources.media
  end

  def index
    @tracks = Track.paginate(page: params[:page])
  end

  def destroy
    track = Track.find(params[:id])
    track.destroy
    flash[:success] = "Track deleted."
    submitter = User.find(params[:user_id])
    redirect_to submitter_path
  end

  private

  def track_params
    params.require(:track).permit(:status, :kind,  :submission_source, :title, :artist, :album, :year, :album_art)
  end

end
