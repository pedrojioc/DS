class LikesController < ApplicationController
	before_action :set_like, only: [:destroy]
	#La variable origin, contiene el origen de donde se desencadena el Like, puede ser un post
	#o un comentario

	def new
		@like = current_user.likes.new
	end
	def create
		@like = current_user.likes.new(likes_params)
		@origin_id = likes_params[:item_id]
		@origin = Object.const_get(likes_params[:item_type]).find(likes_params[:item_id])
		respond_to do |format|
			if @like.save
				format.html { redirect_to "http://localhost:3000/", notice:"Like exitoso"}
				format.js { }
			else
				format.html { redirect_to "http://localhost:3000/", notice: 'Ocurrio un error' }
				format.json { render json: @like.errors, status: :unprocessable_entity }
				raise @like.errors.full_messages.inspect
			end
		end
	end

	def destroy
		#Se obtiene el origen del like que se esta eliminando
		@origin = Object.const_get(@like.item_type).find(@like.item_id)
		@like.destroy
		respond_to do |format|
			format.html { redirect_to "http://localhost:3000/", notice:"Like eliminado" }
			format.js { }
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
