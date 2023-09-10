class OrderSerializer < ActiveModel::Serializer
  attributes :id, :subtotal, :product_id, :cart_id
end
