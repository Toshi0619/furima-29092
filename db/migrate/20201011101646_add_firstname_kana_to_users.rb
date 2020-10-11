class AddFirstnameKanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstname_kana, :string
  end
end
