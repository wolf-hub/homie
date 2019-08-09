class MatchingJob < ApplicationJob
  queue_as :default

  def perform(requesto)
    # Do something later
    @properties = Property.where(home_type: requesto.home_type, minimum_lease: requesto.duration, city: requesto.city).where("address like ? and price <= ? and price >= ? ","%#{requesto.address}%",requesto.max_budget,requesto.min_budget)
    @property.each do |property|
    	PropertyMailer.matching_property_admin_email(property).deliver_later
    end
  end
end
