class Routin < ActiveRecord::Base

	belongs_to :exercise
	belongs_to :workout
	has_many :users, through: :userroutins 
	has_many :userroutins
end
