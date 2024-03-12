# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Faker
require 'faker'
Faker::Config.locale='fr'
Faker::UniqueGenerator.clear

# Effacer toutes les tables
Item.destroy_all
User.destroy_all
Cart.destroy_all
Order.destroy_all
CartItem.destroy_all
OrderItem.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end



puts("--- Start Seeding ---")

20.times do |i|
  i = Item.create!(
    title: Faker::Lorem.sentence(word_count: rand(2..5)),
    description: Faker::Lorem.paragraph(sentence_count: rand(2..7)),
    price: rand(1..10)
  )
  i.photo.attach(io: File.open("app/assets/images/chaton.png"), filename: "chaton", content_type: "image/png")
end
puts("> 20 Items créés")


emails_array =['annie.herieau@gmail.com', "r.robena@gmail.com", "malo.bastianelli@gmail.com", "yann.rezigui@gmail.com"]
emails_array.each do |e|
  u = User.create!(
    email: e,
    password: "1&Azert"
  )
  c = Cart.create!(
      user: u
  )
  rand(2..10).times do |i|
    ci = CartItem.create(
      cart: c,
      item: Item.all.sample
    )
  end
  
end
puts("> 4 Users créés")



