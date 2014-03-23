json.array!(@bank_card_types) do |bank_card_type|
  json.extract! bank_card_type, :id, :name
  json.url bank_card_type_url(bank_card_type, format: :json)
end
