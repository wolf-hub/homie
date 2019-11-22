class Connection < ApplicationRecord
  belongs_to :property
  belongs_to :request
end
