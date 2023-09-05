class AddColumnsToInvoice < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :item_name, :string
    add_column :invoices, :item_type, :string
    add_column :invoices, :unit, :integer
    add_column :invoices, :unit_price, :decimal, precision: 10, scale: 2
  end
end
