class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.string "week_date"
      t.string "user"

      t.timestamps
    end
  end
end
