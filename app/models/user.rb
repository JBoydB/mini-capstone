class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :carted_products
  validates :name, presence: true, length: {minimum: 2}
  validates :email, presence: true, uniqueness: true
end
