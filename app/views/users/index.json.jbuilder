json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :name, :id_num, :login_pass, :pay_pass
  json.url user_url(user, format: :json)
end
