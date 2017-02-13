class PasswordResetsController < ApplicationController

  def new
    User.find_by(username: params[:username])
  end

  def create
    @user = User.find_by(username: params[:password_reset][:username])
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "An email has been sent with instructions for resetting your password."
      redirect_to root_path
    else
      flash.now[:danger] = "User not found."
      render 'new'
    end
  end

  def edit
  end

end

def edit
  user = User.find_by(username: params[:username])
  if user && user.authenticated?(:activation, params[:id])
    if !user.activated?
      user.activate
      message = "Welcome! Your account has been activated.  You can now save and vote on tracks or submit your own."
    else
      message = "This account is already activated."
    end
    log_in user
    flash[:success] = message
    redirect_to user
  else
    flash[:danger] = "Invalid activation link.  Please check the link or request a new code."
    redirect_to root_path
  end
end
