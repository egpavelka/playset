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
        flash[:warning] = "Account not activated.  Check your email for activation link or request a new one."
        redirect_to root_path
      end
    else
      flash.now[:danger] = 'Wrong username and/or password.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
