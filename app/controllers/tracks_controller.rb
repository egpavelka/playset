class TracksController < ApplicationController
  # before_action :logged_in_user, only: [:new, :create, :update, :destroy]

  def new
    @track = Track.new
    # Initialize media params
    @track.media_sources
  end

  def create
    @track = current_user.tracks.create!(track_params)
    if @track.save
      flash[:success] = "Track posted successfully."
      redirect_to root_path
    # Check for errors in submission source first
    elsif track.errors[:set_media_source]
      flash[:error] = "There was an error with the link submitted."
      render 'new'
    # Then check for presence of metadata in validated media
    elsif track.errors[:source_has_metadata]
      flash[:error] = "Metadata could not be retrieved.  Please fill out the fields below."
      render 'add_metadata'
    # Catch any other errors
    else
      flash[:error] = "Submission had errors."
      render 'new'
    end
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
    params.require(:track).permit(:status, :kind, :submission_source, :title, :artist, :album, :year, :album_art)
  end

end
