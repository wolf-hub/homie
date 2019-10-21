class Api::V1::PropertiesController < ApplicationController
	
	acts_as_token_authentication_handler_for User, fallback: :none
	
	respond_to :json

	def index
		@properties = Property.all
		respond_with current_user.requests
	end
end	