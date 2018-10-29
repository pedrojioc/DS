module ApplicationHelper
	def resource
		@resource ||= User.new
	end

	def resource_name
		:user
	end

	def resource_class
		User
	end

	def circle_img url, size=50
		div = content_tag(:div,"",class:"cover circle", style:"height:#{size}px;width:#{size}px;background-image:url(#{url});margin: auto")
		div.html_safe
	end

	def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

	def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
				concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
				concat message
      end)
    end
    nil
	end

end
