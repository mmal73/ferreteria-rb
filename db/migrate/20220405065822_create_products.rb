class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products , force: :cascade do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :stock

      t.timestamps
    end
  end
end
