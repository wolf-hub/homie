class Tenant < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :information, presence: true
  validates :employment_status, presence: true
  validates :working_place, presence: true
  validates :credit_score, presence: true

  belongs_to :user
  has_one_attached :avatar
end
