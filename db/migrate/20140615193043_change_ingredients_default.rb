class ChangeIngredientsDefault < ActiveRecord::Migration
  def change
    change_column :recipes, :ingredients, :string, :default => "- stuff 1-stuff 2 - stuff 3"
  end
end
