class UsersCleanupJob < ApplicationJob
  queue_as :default

  def perform(user)
    user.destroy if !user.activated
  end
end
