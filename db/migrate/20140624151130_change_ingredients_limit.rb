class ChangeIngredientsLimit < ActiveRecord::Migration
  def change
    change_column :recipes, :ingredients, :string, :limit => 1500
  end
end
