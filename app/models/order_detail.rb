class OrderDetail < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, ->{with_deleted}
  belongs_to :cart_order, polymorphic: true, optional: true
  belongs_to :cart, optional: true

  def total_price
    quantity * product.price
  end

  def add_quantity
    self.quantity += 1
  end
   def add_order_detail_exited curr_cart, chosen_product
    self.cart_order = curr_cart
    self.product = chosen_product
  end
   def sub_quantity_by_one
    self.quantity -= 1
  end
   def sub_quantity
    sub_quantity_by_one if quantity > 1
  end
end
