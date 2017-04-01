class VideosController < ApplicationController

  def new
    @video = Video.new()
  end

end

class YouTubeController < VideosController

  def create
    # @yt_video = Video.new(api: 'youtube', query: video_id)?
  end

  def show
  end

  private
  def youtube_params
    params.require(:youtube).permit(:video_id)
  end

end

class VimeoController < VideosController

  private
  def vimeo_params
    params.require(:vimeo).permit(:video_id)
  end

end
