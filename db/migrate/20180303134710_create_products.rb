class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.integer :seller_id
      t.decimal :price
      t.integer :category_id
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
