class Landlord < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :information, presence: true
  validates :phone_number, presence: true

  belongs_to :user
  has_one_attached :avatar
end
