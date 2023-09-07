class AddReferenceInvoiceToCart < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :invoice, foreign_key: true
  end
end
