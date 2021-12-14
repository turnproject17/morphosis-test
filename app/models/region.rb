class Region < ApplicationRecord
  COUNTRY = ['india', 'us', 'thailand']
  enum currency: %w{inr usd sgd}
end
