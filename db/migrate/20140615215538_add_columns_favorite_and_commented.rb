class AddColumnsFavoriteAndCommented < ActiveRecord::Migration
  def change
    add_column :recipes, :favorite, :string, :default => "no"
    add_column :recipes, :commented, :string, :default => "no"
  end
end
