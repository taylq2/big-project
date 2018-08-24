class Product < ApplicationRecord
  ATTRIBUTE_PARAMS = [
    :name, :description, :price, :category_id, :started_at, :finished_at,
    :seller_id, :picture,
    areas_products_attributes: %i(id product_id area_id _destroy)
  ].freeze

  mount_uploader :picture, ImageUploader

  belongs_to :category
  belongs_to :seller

  has_many :areas_products, dependent: :destroy
  has_many :areas, ->{distinct}, through: :areas_products
  has_many :order_details, dependent: :destroy, inverse_of: :cart_order
  has_many :orders, through: :order_details
  has_many :carts, through: :order_details

  accepts_nested_attributes_for :areas_products, allow_destroy: true,
    reject_if: proc{|attributes| attributes["area_id"] == "0"}

  scope :recent, ->{order created_at: :desc}
end
