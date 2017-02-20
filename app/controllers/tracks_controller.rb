class TracksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def new
    @track = Track.new
  end

  def create
    @track = current_user.tracks.build(tracks_params)
    if @track.save
      flash[:success] = "Track posted successfully."
      redirect_to root_path
    else
      flash[:danger] = "Submission had errors."
      render 'new'
    end
  end

  def index
    @tracks = Track.paginate(page: params[:page])
  end

  private

    def tracks_params
      params.require(:track).permit(:src_type, :title, :artist, :album, :year, embedded_attributes: [:url_src, :src_api, :_destroy], upload_attributes: [:file_src, :_destroy])
    end


end
