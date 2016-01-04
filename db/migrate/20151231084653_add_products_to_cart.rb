class AddProductsToCart < ActiveRecord::Migration
  def change
    add_reference :carts, :product, index: true, foreign_key: true
  end
end
