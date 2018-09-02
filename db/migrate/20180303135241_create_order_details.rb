class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :cart_id
      t.integer :quantity, default: 1
      t.integer :status
      t.integer :seller_id
      t.integer :cart_order_id
      t.string :cart_order_type

      t.timestamps
    end
  end
end
