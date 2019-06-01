class TenantsController < ApplicationController
	before_action :set_tenant, except: [:index, :new, :create]
  def new 
     @tenant = Tenant.new(user_id: current_user.id)
  end

  def create
    @tenant = Tenant.new(tenant_params)
    @tenant.user_id = current_user.id
    if @tenant.save
      redirect_to @Tenant, notice: "Data saved"
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
  def set_tenant
      @tenant = Tenant.find(params[:id])
    end
  def tenant_params
      params.require(:tenant).permit(:first_name, :last_name, :information, :employment_status, :working_place, :from_year, :to_year, :credit_score, :address, :phone_number, :avatar)
  end
end
