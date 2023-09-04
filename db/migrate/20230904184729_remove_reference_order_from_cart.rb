class RemoveReferenceOrderFromCart < ActiveRecord::Migration[7.0]
  def change
    remove_reference :carts, :order, foreign_key: true
  end
end
