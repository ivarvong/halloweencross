json.array!(@pages) do |page|
  json.extract! page, :markdown, :slug, :past_slugs, :metadata, :title, :template, :html
  json.url page_url(page, format: :json)
end
