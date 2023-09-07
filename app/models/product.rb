class Product < ApplicationRecord
  validates :product_type, :price, :name, presence: true
  belongs_to :order
  has_one_attached :thumbnail

  enum product_type: {
    product: 0,
    event: 1
  }
end
