class UsuariosController < ApplicationController
	before_action :set_user
	before_action :authenticate_user!, only: [:update]
	before_action :authenticate_owner!, only: [:update]

	def show
		@are_friends = current_user.my_friend?(@user)
		@posts = @user.posts.nuevos.paginate(page:params[:page], per_page:15)
		@count_likes = User.count_likes_for_user(current_user.id)
		@count_friends = Friendship.friendships_of_a_user(@user).count
	end

	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to @user }
				format.json { render :show, status: :created, location: @user }
				format.js
			else
				format.html { redirect_to @user, notice:"Error al actualizar" }
				format.json { render json: @user.errors }
			end
		end
	end
	#Obtiene los amigos del usuario que se selecciono
	def friends
		@friends = User.friends(@user)
	end

	private
		def set_user
			@user = User.find(params[:id])
		end

		def authenticate_owner!
			if current_user != @user
				redirect_to root_path, notice: "No estás autorizado", status: :unauthorized
			end
		end

		def user_params
			#params.require(:post).permit(:body)
			params.require(:user).permit(:email, :username, :name, :bio, :avatar, :cover)
		end
end
