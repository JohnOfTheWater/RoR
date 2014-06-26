class AddFIdToFavRec < ActiveRecord::Migration
  def change
    add_column :fav_recipes, :f_id, :integer
  end
end
