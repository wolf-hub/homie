class Property < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
