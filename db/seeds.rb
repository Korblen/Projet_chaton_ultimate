# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# open-uri
require 'open-uri'
# Faker
require 'faker'
Faker::Config.locale='fr'
Faker::UniqueGenerator.clear

# Effacer toutes les tables
Item.destroy_all
# User.destroy_all
# Cart.destroy_all
# Order.destroy_all
# CartItem.destroy_all
# OrderItem.destroy_all
ActiveStorage::Attachment.all.each { |attachment| attachment.purge }

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
photos=[
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710420775/cats/8x9cq9aso4dnqg4gv3bn2afffwre_ogk3zp.png', 
    filename: '8x9cq9aso4dnqg4gv3bn2afffwre',
    type: "image/png"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710421046/cats/jeanie-de-klerk-PAcT-amBgr4-unsplash_uyti1w_pibwzy.jpg',
    filename: 'jeanie-de-klerk-PAcT-amBgr4-unsplash_uyti1w',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710421016/cats/daria-averina-_867Jy8LCkI-unsplash_jtr84o_ax10mj.jpg',
    filename: 'daria-averina-_867Jy8LCkI-unsplash_jtr84o',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710420894/cats/little-cute-kitten-serhii-kucher_kwrxoq_wnhzun.jpg',
    filename: 'little-cute-kitten-serhii-kucher_kwrxoq',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710420979/cats/Shaelynn-Wade_zijtl5_zcosor.jpg',
    filename: 'Shaelynn-Wade_zijtl5',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710420916/cats/Michelle-Paletz-Larralde_z2tcok_h60cma.jpg',
    filename: 'Michelle-Paletz-Larralde_z2tcok',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710420958/cats/Sarah-Lynn_khcokj_vfctto.jpg',
    filename: 'Sarah-Lynn_khcokj',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710420936/cats/photo-1613685396238-852abd2b6d36_fvvxs4_lrhhah.avif',
    filename: 'photo-1613685396238-852abd2b6d36_fvvxs4',
    type: "image/avif"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710420860/cats/Lauryn-Ashlee_oulorf_hupwqm.jpg',
    filename: 'Lauryn-Ashlee_oulorf',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710420837/cats/Haley-Walls_pq43rp_clg7gc.jpg',
    filename: 'Haley-Walls_pq43rp',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710420816/cats/Gayatri-Cookiespaws-Bhaskar_klwvfn_mn6kxs.jpg',
    filename: 'Gayatri-Cookiespaws-Bhaskar_klwvfn',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710420795/cats/Beata-Miro_dkqu4u_oshsox.jpg',
    filename: 'Beata-Miro_dkqu4u',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710421577/todo/3b74dbc201efeeab0a0ed9f67dc632fc_poasqc_nvcq3c.jpg',
    filename: '3b74dbc201efeeab0a0ed9f67dc632fc_poasqc_nvcq3c',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710421581/todo/5a2a0855f6dde4582e83fd7f23369f79_fnpobo_ojyhbo.jpg',
    filename: '5a2a0855f6dde4582e83fd7f23369f79_fnpobo_ojyhbo',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710421584/todo/632d8c015ba9daaec713ffece50d301e_enofbx_xpbfhu.jpg',
    filename: '632d8c015ba9daaec713ffece50d301e_enofbx_xpbfhu',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710421587/todo/1000_F_486470194_NXXVg9nZnsWicRbKmyMm58BsD9t26nsz_c4hbea_vtuta0.jpg',
    filename: '1000_F_486470194_NXXVg9nZnsWicRbKmyMm58BsD9t26nsz_c4hbea_vtuta0.',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710421591/todo/1000_F_579340210_ZuZPsQPVUkFdEHKKVEX47Q1IxZ9CQnm7_qunp9v_iqhdnr.jpg',
    filename: '1000_F_579340210_ZuZPsQPVUkFdEHKKVEX47Q1IxZ9CQnm7_qunp9v_iqhdnr',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710421595/todo/197500221-funny-cat-in-sunglasses-sits-on-the-roof-of-an-old-house_ksoksf_gt1dto.jpg',
    filename: '197500221-funny-cat-in-sunglasses-sits-on-the-roof-of-an-old-house_ksoksf_gt1dto',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710421598/todo/209403817-a-group-of-cool-cats-wearing-trendy-glasses-scarves-and-hats-striking-a-pose-that-oozes-feline_mkphj4_yolgvf.jpg',
    filename: '209403817-a-group-of-cool-cats-wearing-trendy-glasses-scarves-and-hats-striking-a-pose-that-oozes-feline_mkphj4_yolgvf',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710421602/todo/cute-cat-jumping-transparent-isolated-background-ai_866663-11416_wam58t_jg4d10.avif',
    filename: 'cute-cat-jumping-transparent-isolated-background-ai_866663-11416_wam58t_jg4d10',
    type: "image/avif"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710421607/todo/ea5fe2108b711accc21d732c191c56f6_ivdo8v_mvdxyh.jpg',
    filename: 'ea5fe2108b711accc21d732c191c56f6_ivdo8v_mvdxyh',
    type: "image/jpg"
  },
  {
    url: 'https://res.cloudinary.com/dbu3s1gn0/image/upload/v1710421610/todo/istockphoto-1415563237-612x612_jntxjb_pfizud.jpg',
    filename: 'istockphoto-1415563237-612x612_jntxjb_pfizud',
    type: "image/jpg"
  }
]

puts("--- Start Seeding ---")
count = 0
photos.each do |photo|
  name =''
  name = Faker::Creature::Cat.name until name.length >5
  i = Item.create!(
    title: name,
    description: Faker::Lorem.paragraph(sentence_count: rand(2..7)),
    price: rand(1..10)
  )
  i.photo.attach(io: URI.open(photo[:url]), filename: photo[:filename], content_type: photo[:type])
  count += 1
  puts (count)
end
puts(" Items créés")


emails_array =['annie.herieau@gmail.com', "r.robena@gmail.com", "malo.bastianelli@gmail.com", "yann.rezigui@gmail.com"]
emails_array.each do |e|
  user = User.create!(
    email: e,
    password: "1&Azert",
    admin: [true, false].sample
  )
  chart = user.carts.last
  rand(0..3).times do |i|
    CartItem.create!(
      cart: chart,
      item: Item.all.sample
    )
  end

  rand(1..4).times do |i|
    order = Order.create!(
      user: user
    )
    rand(1..6).times do |i|
      OrderItem.create!(
        order: order,
        item: Item.all.sample
      )
    end
  end
  
end
puts("> 4 Users créés")



