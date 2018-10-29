class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end
	def create
		@comment = current_user.comments.new(comments_params)
		respond_to do |format|
			if @comment.save
				format.html{ redirect_to root_path, notice: "Comentario Creado" }
				format.js{}
			else
				format.html{ redirect_to root_path, error: "Ocurrio un error" }
			end
		end
	end

	private
		def comments_params
			params.require(:comment).permit(:body, :item_type, :item_id)
		end
end
