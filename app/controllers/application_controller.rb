class ApplicationController < ActionController::Base
	acts_as_token_authentication_handler_for User
	rescue_from CanCan::AccessDenied do |exception|
	    redirect_to root_url, :alert => exception.message	    
	end

	before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end

  protected

  	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
	  end
	
	def after_sign_in_path_for(resource)
	    if session[:request].present?
 
      		# save list
      		@request = current_user.requests.create(session[:request]["request"])

      		# clear session
      		session[:request] = nil
 
      		#redirect
      		flash[:notice] = "Sweet, logged in. Nice list, btw :)"      
      		if current_user.role == 'landlord'
		    	#if current_user.landlord
		    		#landlord_path(current_user.landlord)
		    	#else
		    		#new_landlord_path
		    	#end
		    	properties_path
		    		
		    else
		    	#if current_user.tenant
		    		#tenant_path(current_user.tenant)
		    	#else
		    		#new_tenant_path
		    	#end 
		    	requests_path  	
		    end
	    
	    elsif session[:property].present?
	    	
	    	# save list
      		@property = current_user.properties.create(session[:property]["property"])

      		# clear session
      		session[:property] = nil
 
      		#redirect
      		flash[:notice] = "Sweet, logged in. Nice list, btw :)"      
      		if current_user.role == 'landlord'
		    	#if current_user.landlord
		    		#landlord_path(current_user.landlord)
		    	#else
		    		#new_landlord_path
		    	#end
		    	properties_path
		    		
		    else
		    	#if current_user.tenant
		    		#tenant_path(current_user.tenant)
		    	#else
		    		#new_tenant_path
		    	#end
		    	requests_path   	
		    end
	    
	    else
	    	if current_user.role == 'landlord'
		    	#if current_user.landlord
		    		#landlord_path(current_user.landlord)
		    	#else
		    		#new_landlord_path
		    	#end
		    	properties_path
		    		
		    else
		    	#if current_user.tenant
		    		#tenant_path(current_user.tenant)
		    	#else
		    		#new_tenant_path
		    	#end   
		    	requests_path 	
		    end
	    end
	    # return the path based on resource
	    
	    
	end


end
