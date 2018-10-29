class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notification)
    #Si es diferente a una notificacion de amistad entra
    if notification.class.name != "Friendship"
    	notification_count = Notification.for_user(notification.user_id)
      ActionCable.server.broadcast "notifications.#{notification.user_id}",
      								{action: "new_notification", message:notification_count}

    else
      #Se envia el mensaje a la persona que le enviaron la solicitud
      friendship_request = Friendship.pending_for_user(notification.friend_id).count
      ActionCable.server.broadcast "notifications.#{notification.friend_id}",{action: "new_friend_request", message:friendship_request}
    end
  end
end
