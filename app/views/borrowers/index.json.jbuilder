json.array!(@borrowers) do |borrower|
  json.extract! borrower, :id, :name
  json.url borrower_url(borrower, format: :json)
end
