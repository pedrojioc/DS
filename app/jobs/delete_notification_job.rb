class DeleteNotificationJob < ApplicationJob
  queue_as :default

  def perform(notification)
  	if notification != nil
  		Notification.destroy(notification)
  	end
  end
end
