class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
	  end
	
	def after_sign_in_path_for(resource)
	    # return the path based on resource
	    if current_user.role == 1
	    	landlords_new_path	
	    else
	    	landlords_new_path
	    end
	    
	end


end
