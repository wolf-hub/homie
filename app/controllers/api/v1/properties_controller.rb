class Api::V1::PropertiesController < ApplicationController
	
	acts_as_token_authentication_handler_for User, fallback: :none
	protect_from_forgery with: :null_session
	respond_to :json

	def index
		@properties = Property.all
		@properties.map { |property| property_json(property) }
		respond_with @property
	end

	private

	def property_json(property)
    	property.as_json.merge(images: property.images.map { |image| url_for(image) })
  	end
end


