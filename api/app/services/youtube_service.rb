require 'yt'

class YoutubeService
  include EmbeddingUtil
  attr_accessor :url, :data, :id

  def initialize(params)
    @url = params[:url]
    @data = self.call
  end

  def call
    @video_id = @url.match(EmbeddingUtil::valid_youtube_format)[2]
    return Yt::Video.new id: @video_id
  end

  def set_metadata
    data = parse_video
    data[:metadata][:media_path] = self.player_url
    data[:album_art_params] = "https://img.youtube.com/vi/#{@video_id}/hqdefault.jpg"
    return data
  end

  def parse_video
    VideoMetadataService.new(title: @data.title, description: @data.description).perform
  end

  # Verify
  def is_track?
    h, m, s = @data.length.split(':').map{ |n| n.to_i }
    duration = h*3600 + m*60 + s
    return VideoMetadataService.is_track?(@data.title, duration) && @data.category_title == 'Music' && @data.public?
  end

  # Generate url with options for iframe
  def player_url
    "https://www.youtube.com/embed/#{@video_id}?enablejsapi=1&color=white&controls=0&playsinline=1&showinfo=0&rel=0"
  end

end
