class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :area_id
      t.integer :room
      t.string :type

      t.timestamps
    end
  end
end
