class AddTokenToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :token, :string
    add_index :products, :token, unique: true
  end
end
