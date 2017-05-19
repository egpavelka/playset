class TracksController < ApplicationController
  # before_action :set_media

  def new
    # @track = @media.track.create
    @track = Track.new(track_params)
    # @track.media =
  end

  def submit
  end

  def create
  # Initialize media params
  # @track.media_sources.build(media: media_kind, source_path: submission_source)
    @track = current_user.tracks.create!(track_params)
    if @track.save
      # If metadata was retrieved from source, publish the track and render its view.
      if source_has_metadata?
        @track.state = 'published'
        flash[:success] = "Track posted successfully."
        redirect_to root_path
      # If media was created successfully from source but metadata was not retrieved, track state remains as 'draft' and edit page is rendered.
      else
        flash[:error] = "Metadata could not be retrieved.  Please fill out the fields below."
        @track.new_record?
        render 'edit'
      end
    # Catch any other errors
    else
      flash[:error] = "Submission had errors."
      render 'new'
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      flash[:success] = "Track has been published."
      redirect_to root_path
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
    @track = Track.find(params[:id]).media
  end

  def index
    @tracks = Track.paginate(page: params[:page])
  end

  private

  def track_params
    params.require(:track).permit(:playback, :title, :artist, :album, :year, :album_art)
  end

end
