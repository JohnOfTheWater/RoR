class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :recipe_id
      t.integer :user_id
      t.string :username
      t.string :user_image

      t.timestamps
    end
  end
end
