class Order < ApplicationRecord
  belongs_to :cart, optional: true
  belongs_to :product

  def as_json(_option)
    super(
      root: true,
      include: [:product]
    )
  end
end
