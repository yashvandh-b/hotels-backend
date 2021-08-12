# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'time'


50.times do
    Hotel.create(:name => "Sample Hotel", :phone => "1234567890", :email => "sample@hotel.com", :created_at => Time.now, :updated_at => Time.now, :user_id => 1)
end