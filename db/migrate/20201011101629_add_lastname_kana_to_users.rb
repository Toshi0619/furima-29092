class AddLastnameKanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :lastname_kana, :string
  end
end
