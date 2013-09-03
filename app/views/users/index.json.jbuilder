json.array!(@users) do |user|
  json.extract! user, :name, :email, :password_digest, :remember_token, :admin, :height, :weight, :bday, :gender
  json.url user_url(user, format: :json)
end
