class CreateRecipes < ActiveRecord::Migration

  def up
    create_table :recipes do |t|
      t.string "recipe_name", :limit => 30
      t.string "description", :limit => 100
      t.string "preparation", :limit => 1000
      t.string "tags", :limit => 30
      t.string "user", :limit => 30
      t.timestamps
    end
  end

  def down
    drop_table :recipes
  end

end
