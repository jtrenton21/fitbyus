json.array!(@workouts) do |workout|
  json.extract! workout, :name, :day
  json.url workout_url(workout, format: :json)
end
