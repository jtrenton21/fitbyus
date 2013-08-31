class Workout < ActiveRecord::Base
  has_many :exercises, autosave: true
  has_many :reps, through: :exercises
  accepts_nested_attributes_for :exercises, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :reps, allow_destroy: true, reject_if: proc { |attributes| attributes['rep_amount'].blank? }
end
