class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :carted_products
  has_many :product_categories
  has_many :categories, through: :product_categories

  validates :product_name, :price, :desc, presence: true
  validates :product_name, uniqueness: true
  validates :desc, length: {maximum: 500}
  validates :price, numericality: true

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