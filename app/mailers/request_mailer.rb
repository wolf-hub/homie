class RequestMailer < ApplicationMailer
	default from: 'no-reply@homie.com'

	def new_request_email(request)
	    @request = request
	    mail(to: @request.user.email, subject: 'Your request was created')
	end

	def new_request_admin_email(request)
	    @request = request
	    mail(to: 'volodymyr@seedx.us', subject: 'New request was created')
	end

	def update_request_email(request)
	    @request = request
	    mail(to: @request.user.email, subject: 'Your request was updated')
	end

	def update_request_admin_email(request)
	    @request = request
	    mail(to: 'volodymyr@seedx.us', subject: 'Request was updated')
	end
end
