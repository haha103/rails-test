json.array!(@refund_types) do |refund_type|
  json.extract! refund_type, :id, :name
  json.url refund_type_url(refund_type, format: :json)
end
