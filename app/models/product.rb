class Product < ApplicationRecord
  validates :product_type, :price, :name, presence: true
  has_many :order

  enum product_type: {
    product: 0,
    event: 1
  }
end
