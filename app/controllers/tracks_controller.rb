class TracksController < ApplicationController

  # before_action :logged_in_user, only: [:create, :edit, :vote, :destroy]
  # before_action :correct_user, only: [:create, :destroy]
  
  def new
  end

  def create
  end

  def edit
    #to vote
  end

  def vote
  end

  def index
    @tracks = Tracks.all
  end

end
