json.extract! booking, :id, :seat_prn, :user_id, :price, :created_at, :updated_at
json.url booking_url(booking, format: :json)
