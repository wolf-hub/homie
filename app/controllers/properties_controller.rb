class PropertiesController < ApplicationController
  before_action :set_property, except: [:index, :new, :create, :all_requests]
  before_action :authenticate_user!  


  def index
    @properties = current_user.properties
  end

  def new
    @property = current_user.properties.build
  end

  def create
    @property = current_user.properties.build(property_params)
    if @property.save
      redirect_to @property, notice: "Saved..."
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end

  def update
    if @property.update(property_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end

  def show
    @requests = Request.where(home_type: @property.home_type, room_type: @property.room_type, duration: @property.minimum_lease)
  end
  
  def all_requests
    @property = Property.find(params[:property_id])
    @requests = Request.where(home_type: @property.home_type, room_type: @property.room_type, duration: @property.minimum_lease)
  end

  def edit
  end

  def destroy
  end

  private
  def property_params
      params.require(:property).permit(:property_name, :price, :home_type, :room_type, :accommodate, :bed_room, :bath_room, :is_air, :is_parking, :is_washer, :is_balcony, :is_fireplace, :is_internet, :is_gym, :is_pool, :is_dogs, :is_cats, :is_wheelchair, :is_smoking, :address, :minimum_lease, :summary, :active, images: [])
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
