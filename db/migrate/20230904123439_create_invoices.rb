class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.float :subtotal
      t.float :total
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
