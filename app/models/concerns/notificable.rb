module Notificable
	extend ActiveSupport::Concern
	included do
		has_many :notifications, as: :item
		after_create_commit :send_notification_to_users
		after_destroy_commit :delete_notificatio_of_users
	end

	def send_notification_to_users
		#Obtenemos la clase del item por medio del item_type y lo convertimos.
		class_item = Object.const_get(self.item_type)
		#Obtenemos el origen del item, es decir si el like es de un post obtenemos ese post.
		origin_item = class_item.find(self.item_id)
		#raise origin_item.inspect
		#JOB => mandar notificaciones async
		NotificationSenderJob.perform_later(self, origin_item)
	end

	#Se ejecuta cuando un usuario hace unlike
	def delete_notificatio_of_users
		raise self.inspect
		notification = Notification.find_by(item_type:self.class.name, item_id:self.id)
    DeleteNotificationJob.perform_later notification
	end
end
