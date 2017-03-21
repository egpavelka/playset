module TrackSubmissionsHelper

  def add_set_up
  end

  def add_source
  end

  def add_media
  end

  def add_metadata
  end

  def current_step
    @current_step || steps.first
  end

  def next_step
    self.current_step = steps(steps.index(current_step)+1)
  end

  def previous_step
    self.current_step = steps(steps.index(current_step)+1)
  end

end
