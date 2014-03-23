json.array!(@bank_branches) do |bank_branch|
  json.extract! bank_branch, :id, :name
  json.url bank_branch_url(bank_branch, format: :json)
end
