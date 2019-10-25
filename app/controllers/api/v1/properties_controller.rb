class Api::V1::PropertiesController < ApplicationController
	
	acts_as_token_authentication_handler_for User, fallback: :none
	protect_from_forgery with: :null_session
	respond_to :json

	def index
		@properties = Property.all
		@newproperties = @properties.map { |property| property_json(property) }
		respond_with @newproperties
	end

	def show
		@property = Property.find(params[:id])
		@newproperty = property_json(@property)
		respond_with @newproperty
	end

	private

	def property_json(property)
    	property.as_json.merge(images: property.images.map { |image| url_for(image) })
  	end
end


