class CreateRoutins < ActiveRecord::Migration
  def change
    create_table :routins do |t|
      t.integer :exercise_id
      t.integer :workout_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
