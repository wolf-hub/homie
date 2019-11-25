class Request < ApplicationRecord
	validates :address, presence: true
	validates :home_type, presence: true
	validates :bed_room, presence: true
	validates :bath_room, presence: true
	validates :duration, presence: true
	validates :arrival_date, presence: true
	validates :min_budget, presence: true
	validates :max_budget, presence: true
	

	belongs_to :user
	has_many :purchases
	has_many :points
	has_many :connections
end
