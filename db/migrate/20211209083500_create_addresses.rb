class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_cord           ,null: false
      t.integer :prefectures_id       ,null: false
      t.string :municipalities        ,null: false
      t.string :house_number          ,null: false
      t.string :building_name         
      t.string :telephone_number      ,null: false
      t.references :purchase_history  ,null: false, foreign_key: true
      t.timestamps
    end
  end
end
