class CartSerializer < ActiveModel::Serializer
  attributes :id, :total
  has_many :orders, dependent: :destroy
  has_many :products, through: :orders

  has_many :orders do
    link(:related) { cart_orders_path(object.id) }
  end
end
