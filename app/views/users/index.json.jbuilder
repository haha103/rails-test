json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :name, :admin, :email_activated, :mobile_activated, :bankaccount_binded, :id_card, :addr_country, :addr_province, :addr_city, :addr_details, :mobile, :additional_phone
  json.url user_url(user, format: :json)
end
