class AddCommentToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :product, foreign_key: true
  end
end
