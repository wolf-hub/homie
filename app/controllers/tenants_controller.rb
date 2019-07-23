class TenantsController < ApplicationController
	before_action :set_tenant, except: [:index, :new, :create]
  def new 
     @tenant = Tenant.new(user_id: current_user.id)
  end

  def create
    @tenant = Tenant.new(tenant_params)
    @tenant.user_id = current_user.id
    if @tenant.save
      redirect_to @tenant, notice: "Data saved"
    else
      render :new
    end  
  end

  def update
    authorize! :update, @tenant
    if @tenant.update(tenant_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong..."
    end
    redirect_to :action => 'show'
  end

  def edit
    authorize! :edit, @tenant
  end

  def destroy
    authorize! :destroy, @tenant
  end

  def index
  end

  def show
    @requests = current_user.requests
    authorize! :read, @tenant
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_back(fallback_location: request.referer, notice: "Saved...")
  end

  private 
  def set_tenant
      @tenant = Tenant.find(params[:id])
    end
  def tenant_params
      params.require(:tenant).permit(:first_name, :last_name, :information, :employment_status, :working_place, :from_year, :to_year, :credit_score, :address, :phone_number, :avatar)
  end
end
