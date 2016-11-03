class NotificationSenderJob < ApplicationJob
  queue_as :default

  def perform(item, origin)
  	Notification.create(item: item, user_id: origin.user_id)
  end
end
