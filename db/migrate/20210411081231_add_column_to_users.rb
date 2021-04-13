class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :postal_code, :string
    add_column :users, :address, :string
    add_column :users, :telephone_number, :string
    add_column :users, :is_deleted, :boolean
  end
end
