class ChangeUserToCustomers < ActiveRecord::Migration[5.0]
  def change
    rename_table :users, :customers
  end
end
