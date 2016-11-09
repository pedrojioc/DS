class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :set_layout
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_in
  protected
	def set_layout
    if devise_controller? && resource_name == :user && action_name == 'new'
      "landing"
    else
		"application"
    end
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
	end

  #Cargamos las variables globales
	def user_in
		if user_signed_in?
			@user_act = current_user
      @friend_request = Friendship.pending_for_user(current_user).count
		end
	end
end
