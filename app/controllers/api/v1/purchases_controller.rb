class Api::V1::UsersController < ApplicationController
	
	acts_as_token_authentication_handler_for User, fallback: :none
	protect_from_forgery with: :null_session
	respond_to :json

	

	def index
		@purchases = Purchase.where(request_id: params[:request_id], user_id: params[:user_id])
		respond_with @purchases
	end

	
end


