class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def show
    @user = User.find(params[:id])
    redirect_to root_path and return unless @user.activated?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        @user.send_activation_email
        flash[:success] = "Success! An activation link has been sent to the email you used to sign up."
        redirect_to login_path
      else
        render 'new'
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Your profile has been updated."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :profile_bio)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "You must log in to do that."
      redirect_to login_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  def admin_user
    unless current_user.admin?
      flash[:danger] = "You don't have the permissions needed for that."
      redirect_to root_path
    end
  end


end
