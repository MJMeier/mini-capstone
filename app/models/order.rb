class Order < ApplicationRecord
  belongs_to :user

  belongs_to :product

  has_many :cartedproducts

  has_many :users, through: :carted_products

  has_many :products, through: :carted_products
end
