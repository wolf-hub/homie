class PurchasesController < ApplicationController
  def new
  end

  def create

  	@property = Property.find(purchase_params[:property_id])
  	@request = Request.find(purchase_params[:request_id])
  	@purchase = @request.purchases.build(purchase_params)
  	@purchase.user_id = current_user.id

    if current_user.stripe_id.blank?
      flash[:alert] = "Please update your payment method."
      return redirect_to payment_method_path
  		
  	else
  		charge(@purchase)
  	end
  	redirect_to show_request_property_path(@property, @request)
  end

  def index
  end

  def show
  end

  private

  def charge(purchase)
    if !current_user.stripe_id.blank?
        customer = Stripe::Customer.retrieve(current_user.stripe_id)
        charge = Stripe::Charge.create(
          :customer => customer.id,
          :amount => 5 * 100,
          :description => "something",
          :currency => "usd",          
        )

        if charge
          purchase.save
          PurchaseMailer.new_purchase_email(purchase).deliver_later
          PurchaseMailer.new_purchase_tenant_email(purchase).deliver_later
          PurchaseMailer.new_purchase_admin_email(purchase).deliver_later
          flash[:notice] = "Reservation created successfully!"
        else
          flash[:alert] = "Cannot charge with this payment method!"
        end
      end
    rescue Stripe::CardError => e
      flash[:alert] = e.message
  end

  def purchase_params
  	params.require(:purchase).permit(:request_id, :property_id)
  end

end
