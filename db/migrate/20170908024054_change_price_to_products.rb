class ChangePriceToProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :price, :decimal, precision: 6, scale: 2
    change_column :products, :desc, :text
  end
end
