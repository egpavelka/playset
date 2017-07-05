class TracksController < ApplicationController
  
  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      @track.update_column(:published, true)
      flash[:success] = "Track has been published."
      redirect_to track_path
    else
      render 'edit'
    end
  end

  def destroy
    track = Track.find(params[:id])
    track.destroy
    flash[:success] = "Track deleted."
    submitter = User.find(params[:user_id])
    redirect_to submitter_path
  end

  def show
    @track = Track.find(params[:id])
  end

  def index
    @tracks = Track.where(published: true).paginate(page: params[:page])
  end

  private

  def track_params
    params.require(:track).permit(:playback, :title, :artist, :album, :year, :album_art)
  end

end
