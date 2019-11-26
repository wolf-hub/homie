class MatchingJob < ApplicationJob
  queue_as :default

  def perform(requesto)
    # Do something later
    @districts = requesto.address.gsub(/(\[\"|\"\])/, '').split('", "')
    
    @properties = Property.where("home_type = ? and minimum_lease = ? and city = ? and address IN (?) and price <= ? and price >= ? ",requesto.home_type,requesto.duration,requesto.city,@districts,requesto.max_budget,requesto.min_budget)
    @properties.each do |property|
    	Connection.where(:property => property, :request => requesto).first_or_create
    	PropertyMailer.matching_property_email(property, requesto).deliver_later
    end
  end
end
