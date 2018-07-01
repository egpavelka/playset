class EmbeddedsCleanupJob < ApplicationJob
  queue_as :default

  def perform(embedded)
    embedded.destroy if embedded.track.nil?
  end
end
