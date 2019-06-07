class LandlordsController < ApplicationController
  before_action :set_landlord, except: [:index, :new, :create]
  def new 
     @landlord = Landlord.new(user_id: current_user.id)
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
    if @landlord.update(landlord_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong..."
    end
    redirect_to :action => 'show'
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
    @properties = current_user.properties
  end

  private 
  def set_landlord
      @landlord = Landlord.find(params[:id])
    end
  def landlord_params
      params.require(:landlord).permit(:first_name, :last_name, :information, :phone_number, :address, :avatar)
  end
end
