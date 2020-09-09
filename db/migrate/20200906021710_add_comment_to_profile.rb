class AddCommentToProfile < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :profile, foreign_key: true
  end
end
