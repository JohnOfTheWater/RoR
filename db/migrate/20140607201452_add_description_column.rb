class AddDescriptionColumn < ActiveRecord::Migration
  def change
    add_column :recipes, :description, :string, :default => "Awesome Recipe!"
  end
end
