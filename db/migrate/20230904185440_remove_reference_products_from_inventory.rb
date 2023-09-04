class RemoveReferenceProductsFromInventory < ActiveRecord::Migration[7.0]
  def change
    remove_reference :inventories, :product, foreign_key: true
  end
end
