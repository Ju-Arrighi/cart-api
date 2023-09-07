class Cart < ApplicationRecord
  has_many :orders
  has_many :products, through: :orders
  # accepts_nested_attributes_for :cart
end
