namespace :dev do
  task fake_all: :environment do
    Rake::Task['dev:fake_users'].execute
    Rake::Task['dev:fake_products'].execute
    Rake::Task['dev:fake_designers'].execute
  end

  task fake_users: :environment do
    5.times do |i|
      User.create!(
        username: FFaker::Name.first_name,
        email: FFaker::Internet.disposable_email,
        password: 123456,
        avatar: FFaker::Avatar.image,
        role: "designer"
      )
    end
    10.times do |i|
      User.create!(
        username: FFaker::Name.first_name,
        email: FFaker::Internet.disposable_email,
        password: 123456,
        avatar: FFaker::Avatar.image,
        role: ""
      )
    end
    puts "have created fake users"
    puts "now you have #{User.count} users data"
  end

  task fake_products: :environment do
    # Normal Products
    30.times do |i|
      Product.create!(
        name: FFaker::Lorem.word,
        description: FFaker::Lorem.phrase,
        price: rand(200..500),
        thirtydays_status: false,
        user_id: rand(1..5),
        image: FFaker::Image.url
      )
    end
    # 30 Days Products
    20.times do |i|
      Product.create!(
        name: FFaker::Lorem.word,
        description: FFaker::Lorem.phrase,
        price: rand(200..500),
        thirtydays_status: true,
        user_id: rand(1..5),
        image: FFaker::Image.url
      )
    end
    puts "have created fake products"
    puts "now you have #{Product.count} products data"
  end

  #designer fake file
  task fake_designers: :environment do
    Designer.destroy_all

    20.times do |i|
      file = File.open("#{Rails.root}/public/images/designer#{i+1}.jpg")
      
      Designer.create!(
        name: FFaker::Name.first_name,
        brandname: FFaker::Lorem.word,
        description: FFaker::Lorem::sentence(10),
        image: file
        )
    end
    puts "have created fake designers"
    puts "now you have #{Designer.count} designers data"
  end
end