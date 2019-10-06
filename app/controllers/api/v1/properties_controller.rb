class Api::V1::PropertiesController < ApplicationController
	acts_as_token_authentication_handler_for User
	before_action :authenticate_user!
	
	respond_to :json

	def index
		properties = Property.all
		respond_with properties
	end
end	