class AddColumnSubtotalToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :subtotal, :decimal, precision: 10, scale: 2
  end
end
