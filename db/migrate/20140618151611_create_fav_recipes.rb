class CreateFavRecipes < ActiveRecord::Migration
  def up
    create_table :fav_recipes do |t|
      t.string "recipe_name", :limit => 100
      t.string "description", :limit => 110
      t.string "preparation", :limit => 2000
      t.string "tags", :limit => 30
      t.string "user", :limit => 30
      t.string "image"
      t.integer "servings", :default => 2
      t.string "favorite", :default => "no"
      t.string "commented", :default => "no"
      t.integer "rating", :default => 3
      t.string "ingredients"
      t.string "ready_in"

      t.timestamps
    end
  end

  def down
    drop_table :fav_recipes
  end

end
