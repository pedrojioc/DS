module LikesHelper
	def  button_like item_type, item_id, user_id
		i_like = i_like_it(item_type, item_id, user_id)
		#raise i_like.inspect

		if i_like.length > 0
			#Quiere decir que le di like
			#Boton de ya no me gusta
			button_i_do_not_like_it_anymore(i_like)
		else
			#Quiere decir que no le he dado like a esto
			#boton de me gusta
			button_i_like_it item_type, item_id
		end
	end

	private
		def i_like_it item_type, item_id, user_id
			Like.see_if_i_like_it(item_type, item_id, user_id)
		end

		def button_i_do_not_like_it_anymore(like)
			link_to like_path(like[0]), remote: true, method: :delete do
				content_tag(:i,"", class:"fa fa-heart fa-lg", :"aria-hidden" => :true)
			end
		end

		def button_i_like_it item_type, item_id
			link_to likes_path(like:{item_type: item_type, item_id: item_id}), remote: true, method: :post do
				content_tag(:i,"", class:"fa fa-heart-o fa-lg", :"aria-hidden" => :true)
			end
		end
end