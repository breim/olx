json.array!(@products) do |product|
  json.extract! product, :id, :title, :price, :content
  json.url product_url(product, format: :json)
end
