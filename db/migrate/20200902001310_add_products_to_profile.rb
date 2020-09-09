class AddProductsToProfile < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :profile, foreign_key: true
  end
end
