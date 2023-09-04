class Cart < ApplicationRecord
  # belongs_to :order
  has_many :orders
  has_many :products, through: :orders
end
