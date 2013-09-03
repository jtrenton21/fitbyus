class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.boolean :admin
      t.integer :height
      t.integer :weight
      t.integer :bday
      t.string :gender

      t.timestamps
    end
  end
end
