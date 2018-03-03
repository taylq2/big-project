class Order < ApplicationRecord
  enum status: %i(not_accepted accepted shipped rejected)

  belongs_to :buyer

  has_many :order_details, dependent: :destroy, inverse_of: :cart_order
  has_many :products, through: :order_details
end
