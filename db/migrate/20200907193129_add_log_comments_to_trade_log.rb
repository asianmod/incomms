class AddLogCommentsToTradeLog < ActiveRecord::Migration[6.0]
  def change
    add_reference :log_comments, :trading_log, foreign_key: true
  end
end
