class Order < ApplicationRecord
  belongs_to :cart, optional: true
  belongs_to :product
end
