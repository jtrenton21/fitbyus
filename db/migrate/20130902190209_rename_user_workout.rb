class RenameUserWorkout < ActiveRecord::Migration
  def change
 	
 	rename_table :userworkout, :userworkouts

  end
end
