module ApplicationHelper
	def profile(user)
		if user.role == 'landlord'
			@profile = user.landlord
		else
			@profile = user.tenant
		end		
	end
end
