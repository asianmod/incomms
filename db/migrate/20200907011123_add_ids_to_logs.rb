class AddIdsToLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :trading_logs, :seller_id, :integer
  end
end
