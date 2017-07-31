class LikesController < ApplicationController

  def create
    track = Track.find(params[:id])
    current_user.like(track)
    respond_to do |format|
      format.html { redirect_to track }
      format.js
    end
  end

  def destroy
    track = Like.find(params[:id]).liked
    current_user.unlike(track)
    respond_to do |format|
      format.html { redirect_to track }
      format.js
    end
  end

  def index
    @track = Track.find(params[:track_id])
    @likes = @track.likes
  end

end
