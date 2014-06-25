class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string "day"
      t.integer "week_id"
      t.string "recipe_name", :limit => 100
      t.string "description", :limit => 110
      t.string "tags", :limit => 30
      t.string "image"

      t.timestamps
    end
  end
end
