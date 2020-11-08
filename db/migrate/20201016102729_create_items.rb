class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.text    :description
      t.integer :category_id
      t.integer :status_id
      t.integer :beard_id
      t.integer :area_id
      t.integer :day_id
      t.integer :price
      t.references :user, foreign_key: true
      t.integer :purchase
      t.timestamps
    end
  end
end
