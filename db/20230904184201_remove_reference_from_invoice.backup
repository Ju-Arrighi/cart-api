class RemoveReferenceFromInvoice < ActiveRecord::Migration[7.0]
  def change
    remove_reference :invoices, :cart, foreign_key: true
  end
end
