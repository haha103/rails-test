json.array!(@bank_accounts) do |bank_account|
  json.extract! bank_account, :id, :account
  json.url bank_account_url(bank_account, format: :json)
end
