class Workout < ActiveRecord::Base
  has_many :routins
  has_many :exercises, through: :routins 
  has_many :reps, through: :exercises 
  has_many :users, through: :userworkouts
  has_many :userworkouts, :dependent => :destroy

  accepts_nested_attributes_for :exercises, allow_destroy: true
  accepts_nested_attributes_for :reps, allow_destroy: true
  accepts_nested_attributes_for :routins, allow_destroy: true
  # accepts_nested_attributes_for :exercises, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
  # accepts_nested_attributes_for :reps, allow_destroy: true, reject_if: proc { |attributes| attributes['exercise_id'].blank? }
end
