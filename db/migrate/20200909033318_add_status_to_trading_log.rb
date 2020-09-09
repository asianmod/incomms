class AddStatusToTradingLog < ActiveRecord::Migration[6.0]
  def change
    add_column :trading_logs, :status, :integer, default:0
  end
end
