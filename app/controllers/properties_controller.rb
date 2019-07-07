class PropertiesController < ApplicationController
  before_action :set_property, except: [:index, :new, :create, :all_requests, :show_request, :delete_image_attachment]
  before_action :authenticate_user!, except: [:new, :create] 


  def index
    @properties = current_user.properties
  end

  def new
    if user_signed_in?
      @property = current_user.properties.build
    else
      @property = Property.new
    end

  end

  def create
    if current_user.nil?
      session[:property] = params
     # Redirect the user to register/login
      redirect_to new_user_registration_path  
    else
      @property = current_user.properties.build(property_params)
      if @property.save
        PropertyMailer.new_property_email(@property).deliver_later
        PropertyMailer.new_property_admin_email(@property).deliver_later
        render :congratulations, notice: "Saved..."
      else
        flash[:alert] = "Something went wrong..."
        render :new
      end
    end    
  end

  def activate
    if @property.active?
      @property.update_attribute(:active, false)
    else
      @property.update_attribute(:active, true)
    end
    redirect_to request.referer
  end

  def update
    authorize! :update, @property
    if @property.update(property_params)
      PropertyMailer.update_property_email(@property).deliver_later
      PropertyMailer.update_property_admin_email(@property).deliver_later
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end

  def show
    @requests = Request.where(home_type: @property.home_type, room_type: @property.room_type, duration: @property.minimum_lease)
    authorize! :read, @property   
  end
  
  def all_requests
    @property = Property.find(params[:id])
    @requests = Request.where(home_type: @property.home_type, room_type: @property.room_type, duration: @property.minimum_lease)
  end

  def show_request
    @property = Property.find(params[:id])
    @request = Request.find(params[:format])
    @purchase = @request.purchases.build
  end

  def edit
    authorize! :edit, @property
  end

  def destroy
    authorize! :destroy, @property
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_back(fallback_location: request.referer, notice: "Saved...")
  end

  def congratulations
    
  end




  private  


  def property_params
      params.require(:property).permit(:property_name, :price, :home_type, :room_type, :accommodate, :bed_room, :bath_room, :is_air, :is_parking, :is_washer, :is_balcony, :is_fireplace, :is_internet, :is_gym, :is_pool, :is_dogs, :is_cats, :is_wheelchair, :is_smoking, :city, :address, :minimum_lease, :summary, :active, images: [])
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
