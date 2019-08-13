class Point < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :request
end
