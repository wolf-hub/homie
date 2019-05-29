class PropertiesController < ApplicationController
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
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private
  def property_params
      params.require(:property).permit(:property_name, :price, :home_type, :room_type, :accommodate, :bed_room, :bath_room, :is_air, :is_parking, :is_washer, :is_balcony, :is_fireplace, :is_internet, :is_gym, :is_pool, :is_dogs, :is_cats, :is_wheelchair, :is_smoking, :address, :minimum_lease, :summary, :active)
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
