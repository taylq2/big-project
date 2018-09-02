class Order < ApplicationRecord
  enum status: %i(not_accepted accepted shipped rejected)

  belongs_to :buyer

  has_many :order_details, dependent: :destroy, as: :cart_order
  has_many :products, through: :order_details

  accepts_nested_attributes_for :order_details, allow_destroy: true

  ATTRIBUTE_PARAMS = %i(user_id status).freeze

  scope :shopping_cart, ->(user_id){where(user_id: user_id)}
end
