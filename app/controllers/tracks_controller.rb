class TracksController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]

  def new
    @track = Track.new
  end

  def create
    @track = current_user.tracks.build(track_params)
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

    def track_params
      params.require(:track).permit(:title, :artist, :album, :year, media_source_attributes[:file_src, :url_src])
    end


end
