class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        UserMailer.account_activation(@user).deliver_now
        flash[:success] = "Success! An activation link has been sent to the email you used to sign up."
        redirect_to login_path
      else
        render 'new'
      end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end
end
