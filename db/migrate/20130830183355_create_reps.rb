class CreateReps < ActiveRecord::Migration
  def change
    create_table :reps do |t|
      t.integer :exercise_id
      t.integer :rep_amount
      t.integer :rep_weight
      t.integer :duration

      t.timestamps
    end
  end
end
