class EmbeddedsCleanupJob < ApplicationJob
  queue_as :default

  def perform(embedded)
    embedded.destroy if !embedded.has_attribute?(:track)
  end
end
