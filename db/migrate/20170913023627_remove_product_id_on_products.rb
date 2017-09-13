class RemoveProductIdOnProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :product_id, :integer
    add_column :images, :product_id, :integer
  end
end
