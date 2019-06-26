module ApplicationHelper
	
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
end
