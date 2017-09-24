class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :carted_products
  has_many :product_categories
  has_many :categories, through: :product_categories
  def sale_message
    if price.to_i <= 2
      return "Discount Item!"
    else
      return "Everyday Value!"
    end
  end

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end

  def stock?
    in_stock
  end
end