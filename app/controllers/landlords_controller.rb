class LandlordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_landlord, except: [:index, :new, :create, :payment, :add_card]
  
  def new 
     if current_user.landlord
       redirect_to current_user.landlord, notice: "You already have profile."
     else
       if current_user.role == 'tenant'
         redirect_to current_user.tenant, notice: "You are tenant! You couldn't create landlord profile!"
       else
         @landlord = Landlord.new(user_id: current_user.id)
       end
       
     end     
  end

  def create
    @landlord = Landlord.new(landlord_params)
    @landlord.user_id = current_user.id
    if @landlord.save
      redirect_to @landlord, notice: "Data saved"
    else
      render :new
    end  
  end

  def update
    authorize! :update, @landlord
    if @landlord.update(landlord_params)
      redirect_to @landlord, notice: "Data saved"
    else
      flash[:alert] = "Something went wrong..."
      render 'edit'
    end
    
  end

  def edit
    authorize! :edit, @landlord
  end

  def destroy
    authorize! :destroy, @landlord
  end

  def index
  end

  def show
    @properties = current_user.properties
    authorize! :read, @landlord
  end

  def payment
  end

  def add_card
    if current_user.stripe_id.blank?
      customer = Stripe::Customer.create(
        email: current_user.email
      )
      current_user.stripe_id = customer.id
      current_user.save

      # Add Credit Card to Stripe
      customer.sources.create(source: params[:stripeToken])
    else
      customer = Stripe::Customer.retrieve(current_user.stripe_id)
      customer.source = params[:stripeToken]
      customer.save
    end

    flash[:notice] = "Your card is saved."
    redirect_to payment_method_path
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to payment_method_path
  end

  private 
  def set_landlord
      @landlord = Landlord.find(params[:id])
    end
  def landlord_params
      params.require(:landlord).permit(:first_name, :last_name, :information, :phone_number, :address, :avatar)
  end
end
