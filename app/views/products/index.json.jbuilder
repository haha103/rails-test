json.array!(@products) do |product|
  json.extract! product, :id, :target_amount, :target_amount_min, :interest_platform, :interest_investor, :invest_start, :invest_end, :refund_date, :purpose_summary, :purpose_detail
  json.url product_url(product, format: :json)
end
