class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_cord  ,null: false
      t.integer :prefectures_id  ,null: false
      t.string :municipalities  ,null: false
      t.string :house_number  ,null: false
      t.string :building_name  ,null: false
      t.string :telephone_number  ,null: false
      t.timestamps
    end
  end
end