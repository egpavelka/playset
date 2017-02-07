class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] === '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        response = "Account not activated. Check your email for the activation link."
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Wrong email and/or password.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
