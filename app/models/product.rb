class Product < ApplicationRecord
  acts_as_paranoid

  ATTRIBUTE_PARAMS = [
    :name, :description, :price, :category_id, :started_at, :finished_at,
    :seller_id, :picture,
    areas_products_attributes: %i(id product_id area_id _destroy)
  ].freeze

  mount_uploader :picture, ImageUploader

  belongs_to :category
  belongs_to :seller

  has_many :areas_products, dependent: :destroy
  has_many :areas, ->{distinct}, through: :areas_products, dependent: :destroy
  has_many :order_details, dependent: :destroy, as: :cart_order
  has_many :orders, through: :order_details, dependent: :destroy
  has_many :carts, through: :order_details, dependent: :destroy

  accepts_nested_attributes_for :areas_products, allow_destroy: true,
    reject_if: proc{|attributes| attributes["area_id"] == "0"}

  scope :recent, ->{order created_at: :desc}
  scope :product_by_time,
    ->{where "? BETWEEN started_at AND finished_at", Time.now}
  scope :product_by_area,
    ->(area_id){joins(:areas_products).where areas_products: {area_id: area_id}}
  scope :product_by_category,
    ->(category_id){where category_id: category_id}
  scope :product_by_seller_id,
    ->(user_id){where user_id: user_id}
end
