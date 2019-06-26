class PagesController < ApplicationController
  def home
  	if user_signed_in?
  		if current_user.role == 'landlord'
  			if current_user.landlord
  				redirect_to landlord_url(current_user.landlord)
  			else
  				redirect_to new_landlord_url
  			end
  			
  		else
  			if current_user.tenant
  				redirect_to tenant_url(current_user.tenant)
  			else
  				redirect_to new_tenant_url
  			end
  		end
  		
  	end
  end

  def home_landlord
  	if user_signed_in?
  		if current_user.role == 'landlord'
  			if current_user.landlord
  				redirect_to landlord_url(current_user.landlord)
  			else
  				redirect_to new_landlord_url
  			end
  			
  		else
  			if current_user.tenant
  				redirect_to tenant_url(current_user.tenant)
  			else
  				redirect_to new_tenant_url
  			end
  		end
  	end
  end
end
