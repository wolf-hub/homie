class MatchingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    @properties = Property.where(home_type: @request.home_type, minimum_lease: @request.duration, city: @request.city).where("address like ? and price <= ? and price >= ? ","%#{@request.address}%",@request.max_budget,@request.min_budget)
    @property.each do |property|
    	PropertyMailer.matching_property_admin_email(property).deliver_later
    end
  end
end
