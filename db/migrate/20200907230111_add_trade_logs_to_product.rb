class AddTradeLogsToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :trading_logs, :product, foreign_key: true
  end
end
