class ChangeIsActiveOfItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :is_active, :boolean, default: false
  end

  def down
    change_column :items, :is_active, :boolean
  end
end
