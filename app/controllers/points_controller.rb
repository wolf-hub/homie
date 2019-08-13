class PointsController < ApplicationController
  def new
  end

  def create
  	@property = Property.find(point_params[:property_id])
  	@request = Request.find(point_params[:request_id])
  	@point = current_user.points.build(point_params)
    @point.save
    if current_user.freepoints>0
      current_user.freepoints=current_user.freepoints-1
      current_user.save
    end
  	redirect_to show_request_property_path(@property, @request)
  end

  def index
  end

  def show
  end

  private
  def point_params
  	params.require(:point).permit(:request_id, :property_id)
  end

end
