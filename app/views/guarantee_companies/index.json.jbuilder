json.array!(@guarantee_companies) do |guarantee_company|
  json.extract! guarantee_company, :id, :name
  json.url guarantee_company_url(guarantee_company, format: :json)
end
