class Exercise < ActiveRecord::Base
  
  belongs_to :workout
  has_many :reps
  accepts_nested_attributes_for :reps, allow_destroy: true, reject_if: proc { |attributes| attributes['rep_amount'].blank? }

end
