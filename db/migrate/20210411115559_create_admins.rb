class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :email
      t.string :encrypted_password
      t.timestamps :created_at
      t.timestamps :updated_at

      t.timestamps
    end
  end
end
