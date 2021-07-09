json.extract! hotel, :id, :name, :location, :phone, :email, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
