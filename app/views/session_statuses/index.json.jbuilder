json.array!(@session_statuses) do |session_status|
  json.extract! session_status, :id, :code, :name
  json.url session_status_url(session_status, format: :json)
end
