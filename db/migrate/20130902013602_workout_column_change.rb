class WorkoutColumnChange < ActiveRecord::Migration
   def up
  	 add_column :workouts, :workout_type, :string
   end
  
  def down
  	remove_column :workouts, :workout_type
  end
end
