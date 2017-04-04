class VideosController < ApplicationController

  def new
    @video = Video.new
  end

end

class YouTubeController < VideosController

  def create
    @video = Video.new(youtube_params)
  end

  private
  def youtube_params
    params.require(:youtube).permit(:video_id)
  end

end

class VimeoController < VideosController

  def create
    @video = Video.new(vimeo_params)
  end

  private
  def vimeo_params
    params.require(:vimeo).permit(:video_id)
  end

end
