class Cart < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :products, through: :orders
  # accepts_nested_attributes_for :order

  def as_json(_option)
    super(
      root: true,
      include: [:orders, :products]
    )
  end
end
