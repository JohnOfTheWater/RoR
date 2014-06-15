class ChangeRecipesColumnsLimits < ActiveRecord::Migration
  def change
    change_column :recipes, :recipe_name, :string, :limit => 100
    change_column :recipes, :description, :string, :limit => 110
    change_column :recipes, :preparation, :string, :limit => 2000
    change_column :recipes, :user, :string, :limit => 100
  end
end
