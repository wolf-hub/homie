class UserMailer < ApplicationMailer
	default to: -> { 'volodymyr@seedx.us' },
			from: 'no-reply@homie.com'

	def welcome_email(user)
	    @user = user
	    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
	end
end
