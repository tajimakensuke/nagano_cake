class CreateOrdersDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_details do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :amount
      t.integer :making_status
      t.timestamps :created_at
      t.timestamps :updated_at

      t.timestamps
    end
  end
end
