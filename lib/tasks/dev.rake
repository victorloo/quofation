namespace :dev do
  task fake_all: :environment do
    Rake::Task['dev:fake_users'].execute
    Rake::Task['db:seed'].execute
    Rake::Task['dev:fake_designers'].execute
    Rake::Task['dev:fake_products'].execute
    Rake::Task['dev:fake_comments'].execute
    Rake::Task['dev:fake_fitting'].execute
    #Rake::Task['dev:fake_discussion'].execute
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

    20.times do |i|
      file = File.open("#{Rails.root}/public/images/designer#{i+1}.jpg")
      
      Designer.create!(
        name: FFaker::Name.first_name,
        brandname: FFaker::Lorem.word,
        description: FFaker::Lorem::sentence(10),
        image: file,
        user_id: (1+i)
        )
    end
    puts "have created fake designers"
    puts "now you have #{Designer.count} designers data"
  end

  task fake_products: :environment do
    Product.destroy_all
    # Normal Products
    30.times do |i|
      Product.create!(
        name: FFaker::Lorem.word,
        description: FFaker::Lorem.phrase,
        price: rand(200..500),
        thirtydays_status: false,
        designer_id: Designer.all.sample.id,
        image: FFaker::Image.url,
        category_id: Category.all.sample.id
      )
    end
    # 30 Days Products
    20.times do |i|
      Product.create!(
        name: FFaker::Lorem.word,
        description: FFaker::Lorem.phrase,
        price: rand(200..500),
        thirtydays_status: true,
        designer_id: Designer.all.sample.id,
        image: FFaker::Image.url,
        category_id: Category.all.sample.id
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

  task fake_fitting: :environment do
    FittingPhoto.destroy_all
    
    Product.where(thirtydays_status: true).each do |product|
      3.times do |i|
        FittingPhoto.create!(
          image: FFaker::Image.url,
          user_id: User.all.sample.id,
          product_id: product.id
        )
      end
    end
    puts "have created fake fitting_photos"
    puts "now you have #{FittingPhoto.count} fitting_photos data"
  end

  task fake_discussion: :environment do
    Discussion.destroy_all

    FittingPhoto.all.each do |photo|
      # User's discussion
      2.times do |i|
        Discussion.create!(
          content: FFaker::Lorem.sentence,
          user_id: photo.user.id,
          fitting_photo_id: photo.id
        )
      end
      # Designer's discussion
      Discussion.create!(
        content: FFaker::Lorem.sentence,
        user_id: photo.product.designer.user.id,
        fitting_photo_id: photo.id
      )
    end
    puts "have created fake discussions"
    puts "now you have #{Discussion.count} discussion data"
  end

end