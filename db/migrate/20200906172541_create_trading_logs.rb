class CreateTradingLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :trading_logs do |t|
      t.string :trade_log

      t.timestamps
    end
  end
end
