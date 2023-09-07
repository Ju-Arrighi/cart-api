class Order < ApplicationRecord
  belongs_to :cart, optional: true
  has_one :product
  # belongs_to :product
end
