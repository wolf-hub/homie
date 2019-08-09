class PropertyMailer < ApplicationMailer
	default from: 'no-reply@homie.com'

	def new_property_email(property)
	    @property = property
	    mail(to: @property.user.email, subject: 'Your property was created')
	end

	def new_property_admin_email(property)
	    @property = property
	    mail(to: 'volodymyr@seedx.us', subject: 'New property was created')
	end

	def update_property_email(property)
	    @property = property
	    mail(to: @property.user.email, subject: 'Your property was updated')
	end

	def update_property_admin_email(property)
	    @property = property
	    mail(to: 'volodymyr@seedx.us', subject: 'Property was Updated')
	end

	def matching_property_email(property)
		@property = property
	    mail(to: @property.user.email, subject: 'Your property has new request matching')
	end
	
end
