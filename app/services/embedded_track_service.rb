class EmbeddedTrackService
  include DataGrabUtil
  include EmbeddingUtil
  attr_accessor :service_object, :data

  def initialize(params)
    @url = params[:source_path]
    @service = "#{params[:source_service]}Service"
    @user = params[:user_id]
    puts @user
  end

  def perform
    begin
      call_source
      parse_data
    rescue => e
      # errors.add(:base, "Not a valid track resource.")
      puts e.backtrace
      puts e.message
    end
    return @data
  end

  def call_source
    @service_object = @service.safe_constantize.new(url: @url)
  end

  def parse_data
    if track_returned?
      @data = @service_object.set_metadata
      postprocess_metadata
    end
  end

  private

  def track_returned?
    @service_object.data && @service_object.is_track?
  end

  def postprocess_metadata
    @data[:metadata].merge!(
      year: set_year,
      album_art: set_album_art,
      playback: detect_playback,
      # preview: detect_preview,
      user_id: @user )
  end

  def set_year
    DataGrabUtil::year_from_date(@data[:year_params][0], @data[:year_params][1])
  end

  def set_album_art
    DataGrabUtil::file_from_url(@data[:album_art_params])
  end

  def detect_preview
    @service_object.is_preview? ? @service_object.is_preview? : false
  end

  def detect_playback
    ['Vimeo', 'Youtube'].include?(@service) ? 'video' : 'audio'
  end

end
