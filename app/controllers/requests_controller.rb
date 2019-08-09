class RequestsController < ApplicationController
  
  before_action :set_request, except: [:index, :new, :create, :step1, :step2, :step3, :step4, :step5, :step6, :steplast]
  before_action :authenticate_user!, except: [:new, :create, :step1, :step2, :step3, :step4, :step5, :step6, :steplast]

  def response_property
    @property = Property.find(params[:format])
  end
  
  def responses    
    @purchases = Purchase.where(request_id: params[:id])    
  end

  def activate
    if @request.active?
      @request.update_attribute(:active, false)
    else
      @request.update_attribute(:active, true)
    end
    redirect_to request.referer
  end

  def steplast
    if current_user.nil?
      session[:request] = params
     # Redirect the user to register/login
      redirect_to new_user_registration_path  
    else
      @request = current_user.requests.build(request_params)
      if @request.save
        redirect_to @request, notice: "Saved..."
      else
        flash[:alert] = "Something went wrong..."
        render :new
      end
    end    
  end

  def index
    @requests = current_user.requests
  end
    
  

  def show
    authorize! :read, @request
  end

  def update
    authorize! :update, @request
    if @request.update(request_params)
      RequestMailer.update_request_email(@request).deliver_later
        RequestMailer.update_request_admin_email(@request).deliver_later
      flash[:notice] = "Saved..."

    else
      flash[:alert] = "Something went wrong..."
    end
    redirect_to @request
  end

  def destroy
    authorize! :destroy, @request
    @request = Request.find(params[:id])
      @request.destroy

      redirect_to requests_path
  end

  def edit
    authorize! :edit, @request
  end

  def create
    if current_user.nil?
      session[:request] = params
     # Redirect the user to register/login
      redirect_to new_user_registration_path  
    else
      @request = current_user.requests.build(request_params)
      if @request.save
        RequestMailer.new_request_email(@request).deliver_later
        RequestMailer.new_request_admin_email(@request).deliver_later
        MatchingJob.perform_later @requests
        render :congratulations, notice: "Saved..."
      else
        flash[:alert] = "Something went wrong..."
        render :new
      end
    end    
  end

  def new
    if user_signed_in?
      @request = current_user.requests.build
    else
      @request = Request.new
    end    
  end

  def congratulations
    
  end

  

  private
  def request_params
      params.require(:request).permit(:min_budget, :max_budget, :home_type, :room_type, :accommodate, :bed_room, :bath_room, :is_air, :is_parking, :is_washer, :is_balcony, :is_fireplace, :is_internet, :is_gym, :is_pool, :is_dogs, :is_cats, :is_wheelchair, :is_smoking, :city, :duration, :arrival_date, :active, address: [])
  end

  def set_request
    @request = Request.find(params[:id])
  end

end
