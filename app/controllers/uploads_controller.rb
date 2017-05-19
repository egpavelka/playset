class UploadsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update, :destroy]
  def new
  end

  def create
  end
end
