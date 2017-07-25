class LikeController < ApplicationController

  def create
    @like = Like.new(user_id: current_user.id, track_id: params[:track_id])
  end

end
