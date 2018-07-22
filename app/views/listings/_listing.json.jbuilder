json.extract! listing, :id, :user_id, :title, :rate, :deposit, :description, :created_at, :updated_at
json.url listing_url(listing, format: :json)
