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
      if @landlord.errors.full_messages.present?
        if @landlord.errors.full_messages.each_with_index do |msg,i|
          flash["alert"+i.to_s] = msg
        end
        end
      end
      render :new
    end  
  end

  def update
    authorize! :update, @landlord
    if @landlord.update(landlord_params)
      redirect_to @landlord, notice: "Data saved"
    else
      if @landlord.errors.full_messages.present?
        if @landlord.errors.full_messages.each_with_index do |msg,i|
          flash["alert"+i.to_s] = msg
        end
        end
      end
      # flash[:alert] = "Something went wrong..."
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
    session["HTTP_REFERER"] = request.headers["HTTP_REFERER"]
  end

  def add_card
    updated = false
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
      updated = true
    end

    if updated == true
      flash[:notice] = "Your card is updated."
    else
      flash[:notice] = "Your card is saved."
    end    
    if session["HTTP_REFERER"].present?
      if session["HTTP_REFERER"].include? "/landlords/new"
        redirect_to new_landlord_path
      elsif session["HTTP_REFERER"].include? "/payment_method"
        redirect_to payment_method_path
      elsif session["HTTP_REFERER"].include? "/show_request"
        if session["property_id"].present?
          redirect_to all_requests_property_path(session["property_id"])
        else
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
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
