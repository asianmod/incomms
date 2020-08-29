class DropProdutos < ActiveRecord::Migration[6.0]
  def change
    drop_table :produtos
  end
end
