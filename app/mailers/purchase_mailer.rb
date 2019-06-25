class PurchaseMailer < ApplicationMailer
	default from: 'no-reply@homie.com'

	def new_purchase_email(purchase)
	    @purchase = purchase
	    mail(to: @purchase.user.email, subject: 'Your have done new purchase')
	end

	def new_purchase_tenant_email(purchase)
	    @purchase = purchase
	    mail(to: @purchase.request.user.email, subject: 'Your request was accepted!')
	end

	def new_purchase_admin_email(purchase)
	    @purchase = purchase
	    mail(to: 'volodymyr@seedx.us', subject: 'New purchase was done')
	end


end
