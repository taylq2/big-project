class CreateAreaProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :area_products do |t|
      t.integer :area_id
      t.integer :product_id

      t.timestamps
    end
  end
end
