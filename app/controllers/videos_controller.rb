class VideosController < ApplicationController

  def new
    @video = Video.new()
  end

end

class YouTubeController < VideosController

  def create
    @yt_video = Video.new(api: 'youtube', query: video_id)
  end

  def show
  end

end
