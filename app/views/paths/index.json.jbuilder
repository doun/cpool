json.array!(@paths) do |path|
  json.extract! path, :id, :from, :to
  json.url path_url(path, format: :json)
end
