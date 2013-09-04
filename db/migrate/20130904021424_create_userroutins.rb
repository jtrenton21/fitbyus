class CreateUserroutins < ActiveRecord::Migration
 def change
    create_table :userroutins do |t|
      t.integer :user_id
      t.integer :routin_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
