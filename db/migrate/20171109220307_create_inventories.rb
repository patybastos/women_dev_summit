class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :item
      t.integer :quantity, default: 0
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
