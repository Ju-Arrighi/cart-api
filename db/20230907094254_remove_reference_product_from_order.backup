class RemoveReferenceProductFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orders, :product, foreign_key: true
  end
end
