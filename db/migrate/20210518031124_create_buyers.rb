class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string            :postal_code,     null: false
      t.integer           :prefecture_id,   null: false
      t.string            :address1,        null: false
      t.string            :address2,        null: false
      t.string            :building_name
      t.string            :phone_num,       null: false
      t.references        :management,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
