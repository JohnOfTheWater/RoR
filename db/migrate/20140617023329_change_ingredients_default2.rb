class ChangeIngredientsDefault2 < ActiveRecord::Migration
  def change
    change_column :recipes, :ingredients, :string, :default => nil
  end
end
