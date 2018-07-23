json.extract! rent_request, :id, :owner_id, :requester_id, :total_price, :accepted, :created_at, :updated_at
json.url rent_request_url(rent_request, format: :json)
