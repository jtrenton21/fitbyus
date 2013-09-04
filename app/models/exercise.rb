class Exercise < ActiveRecord::Base
  has_many :routins 
  has_many :workouts, through: :routin
  has_many :reps, autosave: true
  has_many :users, through: :userexercises
  has_many :userexercises

  accepts_nested_attributes_for :reps, allow_destroy: true
  accepts_nested_attributes_for :routins, allow_destroy: true
  accepts_nested_attributes_for :userexercises, allow_destroy: true 

   # accepts_nested_attributes_for :reps, allow_destroy: true, reject_if: proc { |attributes| attributes['exercise_id'].blank? }
end
