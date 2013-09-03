class UserWorkouts < ActiveRecord::Migration
 def change
    create_table :userworkouts do |t|
      t.integer :user_id
      t.integer :workout_id
      t.datetime :created_at

      t.timestamps
    end
  end
end