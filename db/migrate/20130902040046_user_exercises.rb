class UserExercises < ActiveRecord::Migration
 def change
    create_table :userexercises do |t|
      t.integer :user_id
      t.integer :exercise_id
      t.datetime :created_at

      t.timestamps
    end
  end
end