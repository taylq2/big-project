class OrderDetail < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, ->{with_deleted}, inverse_of: :cart_order
  belongs_to :cart_order, polymorphic: true, optional: true
  belongs_to :cart, optional: true
end
