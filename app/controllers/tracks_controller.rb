class TracksController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]

  def new
    @track = Track.new
    #
    @track.media_source.build(media: track_kind.new)
  end

  def create
    @track = current_user.tracks.build(track_params)
    @track.media_source.build(media: track_kind.new(track_params[:media_source_attributes]))
    if @track.save
      flash[:success] = "Track posted successfully."
      redirect_to root_path
    else
      flash[:danger] = "Submission had errors."
      render 'new'
    end
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
      params.require(:track).permit(:kind, :title, :artist, :album, :year, media_source_attributes: msa)
    end

    # Retrieve
    def msa
      track_kind&.column_defaults&.keys.try(:-,[:id,:created_at,:updated_at])
    end

    def track_kind
      Track.kinds.detect {|k| k.name == params.dig(:track, :kind)}
    end

end
