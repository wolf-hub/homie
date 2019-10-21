class Api::V1::PropertiesController < ApplicationController
	
	before_action :authenticate_user!
	
	respond_to :json

	def index
		@properties = Property.all
		respond_with @properties
	end
end	