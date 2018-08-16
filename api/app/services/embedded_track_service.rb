class EmbeddedTrackService
  include DataGrabUtil
  include EmbeddingUtil
  attr_accessor :service_object, :data

  def initialize(params)
    @url = params[:url]
    @service = "#{params[:service]}Service"
  end

  def perform
    begin
      call_source # create service object for the corresponding third party service 
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
    @data.merge!(
      year: set_year,
      media_type: detect_playback)
  end

  def set_year
    DataGrabUtil::year_from_date(@data[:year_params][0], @data[:year_params][1])
  end

  def detect_preview
    @service_object.is_preview? ? @service_object.is_preview? : false
  end

  def detect_playback
    if detect_preview
      'preview'
    else
      ['Vimeo', 'Youtube'].include?(@service) ? 'video' : 'audio'
    end
  end

end
