class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :price_total

      t.timestamps null: false
    end
  end
end
