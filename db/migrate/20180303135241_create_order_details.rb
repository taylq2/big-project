class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :cart_id
      t.integer :quantity
      t.integer :status
      t.integer :seller_id

      t.timestamps
    end
  end
end
