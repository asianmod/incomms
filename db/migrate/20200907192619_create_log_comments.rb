class CreateLogComments < ActiveRecord::Migration[6.0]
  def change
    create_table :log_comments do |t|
      t.integer :trade_log_id
      t.string :private_message

      t.timestamps
    end
  end
end
