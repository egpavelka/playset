class TracksCleanupJob < ApplicationJob
  queue_as :default

  def perform(track)
    track.destroy if !track.has_attribute?(:media) || !track.published
  end
end
