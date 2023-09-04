class ChangeProductTypeToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :product_type, 'integer USING CAST(product_type AS integer)'
  end
end
