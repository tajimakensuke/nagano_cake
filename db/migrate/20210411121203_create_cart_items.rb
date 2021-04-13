class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :item_id
      t.integer :customer_id
      t.integer :amount
      t.timestamps :created_at
      t.timestamps :updated_at

      t.timestamps
    end
  end
end
