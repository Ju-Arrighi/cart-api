class AddColumnTotalToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :total, :decimal, precision: 10, scale: 2
  end
end
