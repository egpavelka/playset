class TracksController < ApplicationController
  require 'nokogiri'
  # before_action :check_bandcamp, only: :show
  
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
    check_bandcamp
    @track = Track.find(params[:id])
    @user = User.find(@track.user_id)
  end

  def index
    @tracks = Track.where(published: true).paginate(page: params[:page])
  end

  private

  def track_params
    params.require(:track).permit(:playback, :title, :artist, :album, :year, :album_art)
  end

  def check_bandcamp
    track = Track.find(params[:id])
    if (track.media_type == 'Embedded') && (Embedded.find(track.media_id).source_service == 'Bandcamp')
      begin
        Nokogiri::HTML(open(track.media_path)) do
          puts "ayy"
          return
        end
      rescue OpenURI::HTTPError => e
        embed = Embedded.find(track.media_id)
        new_call = BandcampService.new(url: embed.source_path).base_call
        new_media = new_call[:tracks][0][:file].values.last
        track.media_path = new_media
        track.save!
      end
    end
  end

end
