class AddServingsAndReadyInColumns < ActiveRecord::Migration
  def change
    add_column :recipes, :ready_in, :string
  end
end
