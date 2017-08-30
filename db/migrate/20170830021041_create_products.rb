class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.float :price
      t.string :desc
      t.string :image

      t.timestamps
    end
  end
end
