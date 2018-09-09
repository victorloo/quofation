namespace :dev do
  task fake_users: :environment do
    3.times do |i|
      User.create!(
        username: FFaker::Name.first_name,
        email: FFaker::Internet.email,
        password: 123456,
        avatar: FFaker::Avatar.image,
        role: "designer"
      )
    end
    10.times do |i|
      User.create!(
        username: FFaker::Name.first_name,
        email: FFaker::Internet.email,
        password: 123456,
        avatar: FFaker::Avatar.image,
        role: ""
      )
    end
    puts "have created fake users"
    puts "now you have #{User.count} users data"
  end

  task fake_products: :environment do
    30.times do |i|
      Product.create!(
        name: FFaker::Product.product_name,
        description: FFaker::Lorem.phrase,
        price: rand(200.500),
        thirtydays_status: false,
        user_id: User.where(role: "designer").sample.id
      )
    end
    puts "have created fake products"
    puts "now you have #{Product.count} products data"
  end
end