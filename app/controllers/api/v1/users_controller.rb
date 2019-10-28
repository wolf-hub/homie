class Api::V1::UsersController < ApplicationController
	
	acts_as_token_authentication_handler_for User, fallback: :none
	protect_from_forgery with: :null_session
	respond_to :json

	

	def show
		@user = User.find(params[:id])
		@profile = helpers.profile(@user)
		@newuser = @user.as_json(only: [:email, :role]).merge( profile: @profile)
		respond_with @newuser
	end

	
end


