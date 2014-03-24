json.array!(@guarantees) do |guarantee|
  json.extract! guarantee, :id, :letter_code, :letter_scan
  json.url guarantee_url(guarantee, format: :json)
end
