class LikesController < ApplicationController

  def create
    like = current_user.likes.build(like_params)
    like.save
    respond_to do |format|
      # format.html { redirect_to current_page }
      format.js { render js: "window.location='#{url.to_s}'" }
    end
  end

  def destroy
    like = Like.find_by(like_params)
    like.destroy
    # respond_to do |format|
    #   # format.html { redirect_to track }
    #   format.js { render js: "window.location='#{url.to_s}'" }
    # end
  end

  def index
    @track = Track.find(params[:track_id])
    @likes = @track.likes
  end

  private

  def like_params
    params.require(:like).permit(:likeable_type, :likaeble_id)
  end


end
