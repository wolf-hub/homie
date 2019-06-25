class Property < ApplicationRecord
  validates :property_name, presence: true
  validates :price, presence: true
  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :address, presence: true
  validates :minimum_lease, presence: true
  validates :summary, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true

  belongs_to :user
  has_many :purchases
  has_many_attached :images

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
