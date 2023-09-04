class Product < ApplicationRecord
  validates :product_type, :price, :name, presence: true
  belongs_to :order, optional: true

  enum product_type: {
    product: 0,
    event: 1
  }
end
