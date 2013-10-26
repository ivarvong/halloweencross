json.array!(@photos) do |photo|
  json.extract! photo, :iptc, :data, :caption, :byline, :sizes, :s3_key
  json.url photo_url(photo, format: :json)
end
