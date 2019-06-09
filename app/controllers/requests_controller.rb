class RequestsController < ApplicationController
  before_action :set_request, except: [:index, :new, :create]
  before_action :authenticate_user!


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
    redirect_back(fallback_location: request.referer)
  end

  def destroy
  end

  def edit
  end

  def create
    @request = current_user.requests.build(request_params)
    if @request.save
      redirect_to @request, notice: "Saved..."
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end

  def new
    @request = current_user.requests.build
  end

  

  private
  def request_params
      params.require(:request).permit(:min_budget, :max_budget, :home_type, :room_type, :accommodate, :bed_room, :bath_room, :is_air, :is_parking, :is_washer, :is_balcony, :is_fireplace, :is_internet, :is_gym, :is_pool, :is_dogs, :is_cats, :is_wheelchair, :is_smoking, :address, :duration, :arrival_date)
  end

  def set_request
    @request = Request.find(params[:id])
  end

end
