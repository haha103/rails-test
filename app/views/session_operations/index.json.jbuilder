json.array!(@session_operations) do |session_operation|
  json.extract! session_operation, :id, :name, :name_en
  json.url session_operation_url(session_operation, format: :json)
end
