class ChangeRatingDefaultValue < ActiveRecord::Migration
  def change
    change_column :recipes, :rating, :integer, :default => 3
  end
end
