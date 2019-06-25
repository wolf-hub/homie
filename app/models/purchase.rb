class Purchase < ApplicationRecord
	belongs_to :user
	belongs_to :request
	belongs_to :property 
end
