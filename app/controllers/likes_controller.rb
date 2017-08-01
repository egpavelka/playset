class LikesController < ApplicationController

  def create
    track = Track.find(params[:id])
    current_user.like(track)
    respond_to do |format|
      # format.html { redirect_to current_page }
      format.js { render js: "window.location='#{url.to_s}'" }
    end
  end

  def destroy
    track = Like.find(params[:id]).liked
    current_user.unlike(track)
    respond_to do |format|
      # format.html { redirect_to track }
      format.js { render js: "window.location='#{url.to_s}'" }
    end
  end

  def index
    @track = Track.find(params[:track_id])
    @likes = @track.likes
  end

end
