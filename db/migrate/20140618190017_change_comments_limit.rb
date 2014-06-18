class ChangeCommentsLimit < ActiveRecord::Migration
  def change
    change_column :comments, :comment, :string, :limit => 1500
  end
end
