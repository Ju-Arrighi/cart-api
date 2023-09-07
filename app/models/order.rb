class Order < ApplicationRecord
  belongs_to :cart, optional: true
  belongs_to :product
  # belongs_to :product
  # accepts_nested_attributes_for :products
  def as_json(option={})
    super(
      root: true,
      include: [:product]
    )
  end
end
