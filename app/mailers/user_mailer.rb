class UserMailer < ApplicationMailer
	default to: -> { 'volodymyr@seedx.us' },
			from: 'no-reply@movehomie.com'

	def welcome_email(user)
	    @user = user
	    mail(to: @user.email, subject: 'Thank You For Registering With Homie')
	end
end
