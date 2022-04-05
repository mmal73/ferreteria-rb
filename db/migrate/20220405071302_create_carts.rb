class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts , force: :cascade do |t|

      t.timestamps
    end
  end
end
