class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :buyer_id
      t.integer :status

      t.timestamps
    end
  end
end
