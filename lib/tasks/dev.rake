namespace :dev do
  task fake_all: :environment do
    Rake::Task['dev:fake_users'].execute
    Rake::Task['db:seed'].execute
    Rake::Task['dev:fake_designers'].execute
    Rake::Task['dev:fake_products'].execute
    Rake::Task['dev:fake_comments'].execute
  end

  task fake_users: :environment do
    User.destroy_all
    # User: Designer
    20.times do |i|
      User.create!(
        name: FFaker::Name.first_name,
        email: FFaker::Internet.disposable_email,
        password: 123456,
        avatar: FFaker::Avatar.image,
        role: "designer"
      )
    end
    # User: Normal
    20.times do |i|
      User.create!(
        name: FFaker::Name.first_name,
        email: FFaker::Internet.disposable_email,
        password: 123456,
        avatar: FFaker::Avatar.image,
        role: ""
      )
    end
    puts "have created fake users"
    puts "now you have #{User.count} users data"
  end

  #designer fake file
  task fake_designers: :environment do
    Designer.destroy_all
    first_designer_id =  User.where(role: "designer").first.id
    20.times do |i|
      file = File.open("#{Rails.root}/public/images/designer#{i+1}.jpg")
      
      Designer.create!(
        name: FFaker::Name.first_name,
        brandname: FFaker::Lorem.word,
        description: FFaker::Lorem::sentence(10),
        image: file,
        user_id: (first_designer_id+i)
        )
    end
    puts "have created fake designers"
    puts "now you have #{Designer.count} designers data"
  end

  task fake_products: :environment do
    Product.destroy_all
    # Normal Products
    20.times do |i|
      file = File.open("#{Rails.root}/public/images/product#{i+1}.jpg")

      Product.create!(
        name: FFaker::Lorem.word,
        description: FFaker::Lorem.phrase,
        price: rand(200..500),
        thirtydays_status: false,
        designer_id: Designer.all.sample.id,
        image: file,
        category_id: Category.all.sample.id,
        size_id: Size.all.sample.id,
        color_id: Color.all.sample.id,
        inventory_id: Inventory.all.sample.id
      )
    end
    # 30 Days Products
    20.times do |i|
      file = File.open("#{Rails.root}/public/images/product#{i+1}.jpg")

      Product.create!(
        name: FFaker::Lorem.word,
        description: FFaker::Lorem.phrase,
        price: rand(200..500),
        thirtydays_status: true,
        designer_id: Designer.all.sample.id,
        image: file,
        category_id: Category.all.sample.id,
        size_id: Size.all.sample.id,
        color_id: Color.all.sample.id,
        inventory_id: Inventory.all.sample.id
      )
    end
    puts "have created fake products"
    puts "now you have #{Product.count} products data"
  end

  task fake_comments: :environment do
    Comment.destroy_all

    Product.where(thirtydays_status: true).each do |product|
      3.times do |i|
        Comment.create!(
          content: FFaker::Lorem.sentence,
          user_id: User.all.sample.id,
          product_id: product.id
        )
      end
    end
    puts "have created fake comments"
    puts "now you have #{Comment.count} comments data"
  end

end