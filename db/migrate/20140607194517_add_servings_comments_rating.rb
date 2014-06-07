class AddServingsCommentsRating < ActiveRecord::Migration
  def change
    rename_column :recipes, :description, :ingredients
    add_column :recipes, :servings, :integer, :default => 2
    add_column :recipes, :comment, :string
    add_column :recipes, :rating, :integer
  end
end
