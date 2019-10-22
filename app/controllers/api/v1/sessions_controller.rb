module Api
  module V1
    class SessionsController < Devise::SessionsController
  acts_as_token_authentication_handler_for User
  before_action :authenticate_user!, except: [:create, :destroy]
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  respond_to :json
  

  # POST /users/sign_in
def create
    user_password = params[:user][:password]
    user_email = params[:user][:email]
    user = user_email.present? && User.find_by(email: user_email)

    if user and user.valid_password? user_password
      # sign_in user, store: false
      current_user.update authentication_token: nil
      user.save
      
      render json: user.as_json(only: [:email, :authentication_token]), status: :created 
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
end

  
  # DELETE /users/sign_out
  def destroy
    warden.authenticate!
    reset_token current_user
  end

  private

    def sign_in_params
      params.fetch(:user).permit([:email, :password])
    end

    def reset_token(resource)
      resource.authentication_token = nil
      resource.save!
    end  

   
end 
  end
end