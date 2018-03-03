class Cart < ApplicationRecord
  belongs_to :buyer

  has_many :order_details, dependent: :destroy, inverse_of: :cart_order
  has_many :products, through: :order_details
end
