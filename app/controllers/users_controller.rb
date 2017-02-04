class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :name, :email, :password, :password_confirmation))
      if @user.save
        # success
      else
        render 'new'
      end
  end
end
