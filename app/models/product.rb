class Product < ApplicationRecord
  belongs_to :region

  scope :available, -> { where('stock >?', 0) }
end
