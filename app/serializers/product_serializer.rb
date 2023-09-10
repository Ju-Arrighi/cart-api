class ProductSerializer < ActiveModel::Serializer
  attributes :id, :product_type, :name, :price, :stock, :description, :thumbnail
end
