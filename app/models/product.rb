class Product < ApplicationRecord
  ATTRIBUTE_PARAMS = %i(
    name description price category_id started_at finished_at seller_id picture
  ).freeze

  mount_uploader :picture, ImageUploader

  belongs_to :category
  belongs_to :seller

  has_many :areas_products, dependent: :destroy
  has_many :areas, ->{distinct}, through: :areas_products
  has_many :order_details, dependent: :destroy, inverse_of: :cart_order
  has_many :orders, through: :order_details
  has_many :carts, through: :order_details

  scope :recent, ->{order created_at: :desc}
end
