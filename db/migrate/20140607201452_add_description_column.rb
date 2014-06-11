class AddDescriptionColumn < ActiveRecord::Migration
  def change
    add_column :recipes, :ingredients, :string, :default => "lot of stuff!"
  end
end
