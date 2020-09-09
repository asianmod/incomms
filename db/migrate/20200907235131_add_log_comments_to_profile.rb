class AddLogCommentsToProfile < ActiveRecord::Migration[6.0]
  def change
    add_reference :log_comments, :profile, foreign_key: true
    remove_column :log_comments, :trade_log_id
  end
end
