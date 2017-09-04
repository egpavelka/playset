require 'vimeo_me2'

class VimeoService
  include EmbeddingUtil
  attr_accessor :url, :data, :id

  def initialize(params)
    @url = params[:url]
    @data = self.call
  end

  def call
    @video_id = url.match(EmbeddingUtil::valid_vimeo_format)[1]
    return VimeoMe2::Video.new(Rails.application.secrets.vimeo_access_token, @video_id).video
  end

  def set_metadata
    data = parse_video
    data[:metadata][:media_path] = self.player_url
    data[:album_art_params] = @data['pictures']['sizes'].last['link']
    return data
  end

  def parse_video
    VideoMetadataService.new(title: @data['name'], description: @data['description']).perform
  end

  def player_url
    "https://player.vimeo.com/video/#{@video_id}?color=ffffff&title=0&byline=0&portrait=0"
  end

  def is_track?
    VideoMetadataService.is_track?(@data['name'], @data['duration']) && @data['privacy']['embed'] == 'public'
  end

end
