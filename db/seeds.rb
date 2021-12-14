# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create!(name: "admin")
Role.create!(name: "customer")
User.create!(email: 'admin@example.com', password: '121212', password_confirmation: '121212', role_ids: [Role.find_by_name('admin').id]) if Rails.env.development?
User.create!(email: 'customer1@example.com', password: '121212', password_confirmation: '121212', role_ids: [Role.find_by_name('customer').id]) if Rails.env.development?
User.create!(email: 'customer2@example.com', password: '121212', password_confirmation: '121212', role_ids: [Role.find_by_name('customer').id]) if Rails.env.development?
Region.create!(title: "Region1", country: "us", currency:"usd", tax:10)
Region.create!(title: "Region2", country: "thailand", currency:"sgd", tax:8)
Region.create!(title: "Region3", country: "india", currency:"inr", tax:10)
Product.create!(title: 'chair', description: "lorem.. ", image_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fcode.tutsplus.com%2Ftutorials%2Frails-image-upload-using-paperclip-in-a-rails-application--cms-25974&psig=AOvVaw10LgQtK4r5Bl167wOsrZzU&ust=1639567609746000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJifs7qX4_QCFQAAAAAdAAAAABAD", price: "120", sku: "upc", stock: 20, region: Region.first)
Product.create!(title: 'table', description: "lorem.. ", image_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fcode.tutsplus.com%2Ftutorials%2Frails-image-upload-using-paperclip-in-a-rails-application--cms-25974&psig=AOvVaw10LgQtK4r5Bl167wOsrZzU&ust=1639567609746000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJifs7qX4_QCFQAAAAAdAAAAABAD", price: "340", sku: "upctable", stock: 0, region: Region.second)
Product.create!(title: 'table', description: "lorem.. ", image_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fcode.tutsplus.com%2Ftutorials%2Frails-image-upload-using-paperclip-in-a-rails-application--cms-25974&psig=AOvVaw10LgQtK4r5Bl167wOsrZzU&ust=1639567609746000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJifs7qX4_QCFQAAAAAdAAAAABAD", price: "120", sku: "upctabk", stock: 70, region: Region.second)
Product.create!(title: 'almirah', description: "lorem.. ", image_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fcode.tutsplus.com%2Ftutorials%2Frails-image-upload-using-paperclip-in-a-rails-application--cms-25974&psig=AOvVaw10LgQtK4r5Bl167wOsrZzU&ust=1639567609746000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJifs7qX4_QCFQAAAAAdAAAAABAD", price: "120", sku: "upcss", stock: 13, region: Region.third)

PaymentGateway.create!(name: 'Stripe test', ssid: "XXXXXXXXXXXXXXXX", sstoken: "XXXXXXXXXXXXXXXX-token")