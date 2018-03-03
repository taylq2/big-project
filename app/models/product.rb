class Product < ApplicationRecord
  belongs_to :category
  belongs_to :seller

  has_many :areas_products, dependent: :destroy
  has_many :areas, ->{distinct}, through: :areas_products
  has_many :order_details, dependent: :destroy, inverse_of: :cart_order
  has_many :orders, through: :order_details
  has_many :carts, through: :order_details
end
