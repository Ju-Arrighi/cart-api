class DropInventoriesTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :inventories
  end
end