json.extract! hotel, :id, :name, :location, :phone, :website, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
