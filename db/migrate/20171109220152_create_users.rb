class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :gender, limit: 1
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
