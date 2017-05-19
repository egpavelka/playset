class EmbeddedsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update, :destroy]
  require 'httparty'

  def new
    @embedded = Embedded.new
  end

  def create
    # Check source_path for appropriate service and create a corresponding object to generate player_url and query track data.
    @embedded = Embedded.new(embedded_params)
    if @embedded.save
    else

    end
  end

  ####################
  # EMBED SOURCES:
  # PARSE SOURCE_PATH,
  # CREATE API_URL and IFRAME_URL
  ####################


  private

  def embedded_params
    params.require(:embedded).permit(:source_path, :player_url, :auto_metadata)
  end

  # Check that source_path is in a valid format for a supported service and initialize variables for that service.

  def api_call(url)
    response = HTTParty.get(url)
    response.parsed_response
 end


end
