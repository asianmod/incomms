class AddLogsToProfile < ActiveRecord::Migration[6.0]
  def change
    add_reference :trading_logs, :profile, foreign_key: true
  end
end
