json.array!(@emails) do |email|
  json.extract! email, :id, :addr, :primary, :user_id
  json.url email_url(email, format: :json)
end
