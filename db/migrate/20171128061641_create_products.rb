class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :color
      t.boolean :visible
      t.timestamp :expire_at
      t.float :price
      t.integer :stock

      t.timestamps
    end
  end
end
