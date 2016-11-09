class DeleteNotificationJob < ApplicationJob
  queue_as :default

  def perform(notification)
    Notification.destroy(notification)
  end
end
