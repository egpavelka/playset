module TrackSubmissionsHelper

  # Allowed validations

  def current_step
    @current_step || steps.first
  end

  def next_step
    self.current_step = steps(steps.index(current_step)+1)
  end

  def previous_step
    self.current_step = steps(steps.index(current_step)+1)
  end

  # def set_source
  #   track.kind = params[:commit]
  #   # make sure kind corresponds with file/link source field
  #   # check that it's a valid member of that class
  #   # if track_loaded? show metadata fields
  #   # else
  # end
  #
  # def track_loaded?
  #   # upload_successful? or embed_successful? (got api response?)
  # end
  #
  # def has_metadata?
  #   # retrieve metadata from embedded sources
  #   # check mp3 for metadata
  #   # populate metadata form with retrieved values, disable populated fields
  # end
  #
  # # Track metadata
  # def track_metadata
  # end

end
