class Users::OmniauthCallbacksController < ApplicationController
	def facebook
		@user = User.from_omniauth(request.env["omniauth.auth"])
		if @user.persisted?
			@user.remember_me = true
			sign_in_and_redirect @user, event: :authentication
			return
		end

		session["devise.auth"] = request.env["omniauth.auth"]

		render :edit

	end

	def custom_sign_up
		@user = User.from_omniauth(session["devise.auth"].symbolize_keys)
		if @user.update(users_params)
			sign_in_and_redirect @user, event: :authentication
		else
			render :edit
		end
	end

	def failure
		redirect_to new_user_session_path, notice: "Error: #{params[:error_description]}. Motivo: #{params[:error_reason]}"
	end

	#Metodos privados
	private
	def users_params
		params.require(:user).permit(:name, :username, :email)
	end


end