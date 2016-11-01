class LikesController < ApplicationController
	before_action :set_like, only: [:destroy]


	def create
		@like = current_user.likes.new(likes_params)
		@post = Post.get_post likes_params[:item_id]
		respond_to do |format|
			if @like.save
				format.html { redirect_to "http://localhost:3000/", notice:"Like exitoso"}
				format.js { render :show }
			else
				format.html { redirect_to "http://localhost:3000/", notice: 'Ocurrio un error' }
				format.json { render json: @like.errors, status: :unprocessable_entity }
				raise @like.errors.full_messages.inspect
			end
		end
	end

	def destroy
		@post =  Post.get_post @like.item_id
		@like.destroy
		respond_to do |format|
			format.html { redirect_to "http://localhost:3000/", notice:"Like eliminado" }
			format.js { render :show }
		end
	end

	private

		def set_like
			@like = Like.find(params[:id])
		end

		def likes_params
			params.require(:like).permit(:item_type, :item_id)
		end
end