class TracksController < ApplicationController
  # before_action :logged_in_user, only: [:destroy]

  def create
    @track = Track.new(track_params)
  end

  def show
    @track = Track.find(params[:id]).media_source.media
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
    params.require(:track).permit(:status, :kind, :source_path, :title, :artist, :album, :year, media_source_attributes: media_params)
  end

  def media_params
    unless params[:id].nil?
      Track.find(params[:id]).kind.constantize.column_names
    end
  end

end
