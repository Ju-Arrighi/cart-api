class Product < ApplicationRecord
  enum product_type: {
    product: 0,
    event: 1
  }
end
