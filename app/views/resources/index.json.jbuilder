json.array!(@resources) do |resource|
  json.extract! resource, :id, :path_id, :start_time, :open_time, :close_time, :created_by_id, :driver_id
  json.url resource_url(resource, format: :json)
end
