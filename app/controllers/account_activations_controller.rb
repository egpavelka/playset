class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
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

end
