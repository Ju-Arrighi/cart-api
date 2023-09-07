class RemoveReferenceFromCart < ActiveRecord::Migration[7.0]
  def change
    remove_reference :carts, :invoice, foreign_key: true
  end
end
