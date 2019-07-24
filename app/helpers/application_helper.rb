module ApplicationHelper
	
	def getenquires(property)
		Request.where(home_type: property.home_type, duration: property.minimum_lease, city: property.city)
	end

	def cp(path)
	  "active" if current_page?(path)
	end

	def profile(user)
		if user.role == 'landlord'
			@profile = user.landlord
		else
			@profile = user.tenant
		end		
	end

	def create_profile(user)
		if user.role == 'landlord'
			new_landlord_path
		else
			new_tenant_path
		end	
	end	

	def pluralize_without_count(count, noun, text = nil)
	  if count != 0
	    count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
	  end
	end

	def showavatar(user)
		if profile(user)
			if profile(user).avatar.attached?
				image_tag profile(user).avatar
			else
				image_tag 'noava.jpg'
			end
		else
			image_tag 'noava.jpg'
		end
	end

	def showavatarsmall(user)
		if profile(user)
			if profile(user).avatar.attached?
				image_tag profile(user).avatar, size: "50x50"
			else
				image_tag 'noava.jpg', size: "50x50"
			end
		else
			image_tag 'noava.jpg', size: "50x50"
		end
	end

	def showavatarurl(user)
		if profile(user)
			if profile(user).avatar.attached?
				profile(user).avatar
			else
				'noava.jpg'
			end
		else
			'noava.jpg'
		end
	end


	def resource_name
	    :user
	  end
	 
	  def resource
	    @resource ||= User.new
	  end
	 
	  def devise_mapping
	    @devise_mapping ||= Devise.mappings[:user]
	  end
end
