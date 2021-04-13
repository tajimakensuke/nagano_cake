class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.string :name
      t.timestamps :created_at
      t.timestamps :updated_at

      t.timestamps
    end
  end
end
