class Api::V1::PropertiesController < ApplicationController
	
	acts_as_token_authentication_handler_for User, fallback: :none
	protect_from_forgery with: :null_session
	respond_to :json

	def index
		@properties = Property.all
		@improp = @properties[0].images[0]
		respond_with @improp
	end
end	