class SearchPeopleController < ApplicationController

	def search_suggestions
		render json: User.terms_for(params[:term])
	end

	def search
		@people = User.terms_for(params[:term])
	end
end
