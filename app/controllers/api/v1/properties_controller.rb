class Api::V1::PropertiesController < ApplicationController
	
	before_action :authenticate_user!
	
	respond_to :json

	def index
		@properties = current_user.properties
		respond_with @properties
	end
end	