module LikesHelper

	def button_like origin, user
		like = origin.likes.find_by(item_type:origin.class.name, user_id:user)
		if like == nil
			render(partial: "likes/new", locals: {origin: origin})
		else
			render(partial: "likes/show", locals: {like: like})
		end
	end
end
