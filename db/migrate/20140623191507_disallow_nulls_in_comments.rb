class DisallowNullsInComments < ActiveRecord::Migration
  def change
    change_column_null :comments, :user_id, false
    change_column_null :comments, :image_id, false
  end
end
