json.array!(@devices) do |device|
  json.extract! device, :id, :name, :long_name, :os
  json.url device_url(device, format: :json)
end
