class Cart < ApplicationRecord
  # belongs_to :order
  has_many :orders
  has_many :products, through: :orders
  accepts_nested_attributes_for :orders
end
