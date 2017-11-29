json.extract! product, :id, :name, :description, :category, :color, :visible, :expire_at, :price, :stock, :created_at, :updated_at
json.url product_url(product, format: :json)
