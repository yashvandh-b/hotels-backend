# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'time'


Hotel.create(:name => "abc", :location => "chennai", :phone => "1234567890", :website => "abc@abc.com", :created_at => Time.now, :updated_at => Time.now, :user_id => 3)