class Embedded < ApplicationRecord
  include SessionsHelper
  include DataGrabUtil

  has_one :track_source, as: :media
  has_one :track, through: :track_sources
  
  serialize :auto_metadata, Hash
  # attr_accessor :tracks

  ####################
  # SETUP: SOURCES,
  # LINK CHECK
  ####################

  # Click-to-submit supplies source_path only.
  # First check for source_path,
  validates :source_path, presence: true
  # Then run custom validation against multiple valid url formats, and, if one is successfully matched, create an instance of the corresponding subclass.
  after_validation :get_source
  before_save :source_service, presence: true
  before_save :set_parameters
  before_save :auto_metadata, presence: true

  VALID_BANDCAMP_FORMAT = /^https?:\/\/[^#\&\?\/\s]*\.bandcamp\.com\/track\/[^#\&\?\/\s]*$/i
  VALID_SOUNDCLOUD_FORMAT = /^(https?:\/\/)?(www.|m\.)?soundcloud\.com\/[\w\-\.]+\/[\w\-\.]+$/i
  VALID_SPOTIFY_FORMAT = /^(spotify:track:|https?:\/\/[a-z]+\.spotify\.com\/track\/)([^#\&\?\/]*)$/i
  VALID_VIMEO_FORMAT = /^https?:\/\/vimeo\.com\/+([^#\&\?\/]*)/i
  VALID_YOUTUBE_FORMAT = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*)$/i

  ####################
  # BASE METHODS FOR
  # SOURCE SUBCLASSES
  ####################

  def get_source
    supported_sources = {
      VALID_BANDCAMP_FORMAT => 'Bandcamp',
      VALID_SOUNDCLOUD_FORMAT => 'Soundcloud', # Soundcloud gem uses "Soundcloud"
      VALID_SPOTIFY_FORMAT => 'Spotify',
      VALID_VIMEO_FORMAT => 'Vimeo',
      VALID_YOUTUBE_FORMAT => 'Youtube'
    }
    # Detect the urL_source by finding a match for source_path in the regex variables (keys in supported_sources)
    url_source = supported_sources.keys.detect { |valid_format| source_path.match(valid_format) }
    # source_service becomes instance of
    self.source_service = supported_sources.fetch(url_source)
  end

  def set_parameters
    service = "Embedded::#{self.source_service}".safe_constantize.new
    api_response = service.get_data(source_path)
    self.auto_metadata = service.set_metadata(api_response)
  end

  def generated_track_params(submitter_id)
    metadata = self.auto_metadata
    metadata[:user_id] = submitter_id
    ['Vimeo', 'Youtube'].include?(self.source_service) ? metadata[:playback] = 'video' : metadata[:playback] = 'audio'
    return metadata
  end

end
