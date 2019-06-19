class RequestsController < ApplicationController
  before_action :set_request, except: [:index, :new, :create, :step1, :step2, :step3, :step4, :step5, :step6, :steplast]
  before_action :authenticate_user!, except: [:new, :create, :step1, :step2, :step3, :step4, :step5, :step6, :steplast]


  def step1
    if user_signed_in?
      @request = current_user.requests.build
    else
      @request = Request.new
    end
  end

  def step2
    session[:request] ||= {}
    session[:request].merge!{request_params}
    @request = Request.new
  end

  def step3
    session[:request] ||= {}
    session[:request].merge!{request_params}
    @request = Request.new
  end

  def step4
    session[:request] ||= {}
    session[:request].merge!{request_params}
    @request = Request.new
  end

  def step5
    session[:request] ||= {}
    session[:request].merge!{request_params}
    @request = Request.new
  end

  def step6    
    session[:request] ||= {}
    session[:request].merge!{request_params}
    @request = Request.new
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
    if current_user.role == 'landlord'
      @property = Property.find(params[:property_id])
    @requests = Request.where(home_type: @property.home_type, room_type: @property.room_type, duration: @property.minimum_lease)
    else
      @requests = current_user.requests
    end
    
  end

  def show
  end

  def update
    if @request.update(request_params)
      flash[:notice] = "Saved..."

    else
      flash[:alert] = "Something went wrong..."
    end
    redirect_to @request
  end

  def destroy
  end

  def edit
  end

  def create
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

  def new
    if user_signed_in?
      @request = current_user.requests.build
    else
      @request = Request.new
    end
    
  end

  

  private
  def request_params
      params.require(:request).permit(:min_budget, :max_budget, :home_type, :room_type, :accommodate, :bed_room, :bath_room, :is_air, :is_parking, :is_washer, :is_balcony, :is_fireplace, :is_internet, :is_gym, :is_pool, :is_dogs, :is_cats, :is_wheelchair, :is_smoking, :address, :duration, :arrival_date, :active)
  end

  def set_request
    @request = Request.find(params[:id])
  end

end
