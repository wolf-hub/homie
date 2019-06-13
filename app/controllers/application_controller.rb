class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
	  end
	
	def after_sign_in_path_for(resource)
	    # return the path based on resource
	    if current_user.role == 'landlord'
	    	if current_user.landlord
	    		landlord_path(current_user.landlord)
	    	else
	    		new_landlord_path
	    	end
	    		
	    else
	    	if current_user.tenant
	    		tenant_path(current_user.tenant)
	    	else
	    		new_tenant_path
	    	end   	
	    end
	    
	end


end
