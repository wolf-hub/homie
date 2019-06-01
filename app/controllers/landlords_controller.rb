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
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  private 
  def set_landlord
      @landlord = Landlord.find(params[:id])
    end
  def landlord_params
      params.require(:landlord).permit(:first_name, :last_name, :information, :phone_number, :avatar)
  end
end
