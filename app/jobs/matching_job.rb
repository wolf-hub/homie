class MatchingJob < ApplicationJob
  queue_as :default

  def perform(requesto)
    # Do something later
    @districts = requesto.address.gsub(/(\[\"|\"\])/, '').split('", "')
    
    @properties = Property.where("home_type = ? and minimum_lease = ? and city = ? and address = ? and price <= ? and price >= ? ",requesto.home_type,requesto.duration,requesto.city,@districts,requesto.max_budget,requesto.min_budget)
    @properties.each do |property|
    	PropertyMailer.matching_property_email(property).deliver_later
    end
  end
end
