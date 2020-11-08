class CreateShopaddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shopaddresses do |t|
      t.string  :postcode,         default: "",  null: false
      t.integer :prefecture_id,                  null: false
      t.string  :municipality,     default: "",  null: false
      t.string  :address,          default: "",  null: false
      t.string  :building_name,    default: ""
      t.string  :phone_number,                   null: false
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
