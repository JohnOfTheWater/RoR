class AddServingsRating < ActiveRecord::Migration
  def change
    add_column :recipes, :servings, :integer, :default => 2
    add_column :recipes, :rating, :integer
  end
end
