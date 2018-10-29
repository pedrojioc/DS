class FriendshipsController < ApplicationController
	before_action :find_friend, except: [:index, :update, :destroy, :friends]
	before_action :find_friendship, only: [:update, :destroy]

	def index
		@pending_friendships = current_user.followers.pending.decorate
		#@accepted_friendships = current_user.followers.active.decorate
		@pending_requests = current_user.friendships.pending.decorate
	end

	def create
		friendship = Friendship.new(user: current_user, friend: @friend)
		respond_to do |format|
			if friendship.save
				format.html { redirect_to @friend }
				format.js
			else
				format.html { redirect_to @friend, notice: "Error con la solicitud de amistad" }
				format.js
			end
		end
	end

	def update
		if params[:status] == "1"
			@friendship.accepted!
		elsif params[:status] == "0"
			@friendship.rejected!
		end
		respond_to do |format|
			format.html{ redirect_to friendships_path }
		end
	end

	def destroy
		@user = User.find(@friendship.user.id)
		@friendship.destroy
		respond_to do |format|
			format.html { redirect_to friendships_path, notice: "Amistad rechazada." }
			format.js
		end
	end


	private
		def find_friend
			@friend = User.find(params[:friend_id])
		end
		def find_friendship
			@friendship = Friendship.find(params[:id])
		end
end
