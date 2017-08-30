class EmbeddedTrackService
  include DataGrabUtil
  include EmbeddingUtil
  attr_accessor :url, :service, :service_object, :metadata

  def initialize(params)
    @url = params[:source_path]
    @service = params[:source_service]
  end

  def perform
    begin
      set_source
      call_source
    rescue
    end
  end

  def set_source
    @service_object = @service.safe_constantize.new
  end

  def call_source
    @service_object.get_data(@url)
  end

  def parse_metadata
    response = call_source
    if track_returned?(response)
      @metadata = @service_object.set_metadata(response)
    else
      errors.add(:base, "Not a valid track resource.")
    end
  end

  def track_returned?(response)
    @service_object.is_track?(response)
  end

  def detect_playback(service)
    ['Vimeo', 'Youtube'].include?(service) ? 'video' : 'audio'
  end

  def make_track
  end

end
