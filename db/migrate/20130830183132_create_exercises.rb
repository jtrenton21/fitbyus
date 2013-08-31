class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :exercise_type
      t.string :target
      t.text :info
      t.string :outside_link
      t.integer :workout_id
      t.timestamps
    end
  end
end
