namespace :dev do
  designer_image = [
    'https://cdn.filestackcontent.com/i6N8wpDITniFFV1cuzON',
    'https://cdn.filestackcontent.com/hm9g3Ge6ScmkDInFaXsb',
    'https://cdn.filestackcontent.com/VRqcFgdcRrKfAMz3x6J7',
    'https://cdn.filestackcontent.com/styDOdQeTJWcpTvsKKzK',
    'https://cdn.filestackcontent.com/bG5C6WdQvSmHawZ291Ue',
    'https://cdn.filestackcontent.com/j33GUkdvTT2UrlaDxXUu',
    'https://cdn.filestackcontent.com/Vk6G1KkQTym6jO0Gsh1K',
    'https://cdn.filestackcontent.com/xm5zQWlRZOJnlLblfljQ',
    'https://cdn.filestackcontent.com/5yaqdeYLQ5TGdJsPbPeU',
    'https://cdn.filestackcontent.com/gV5kWwIRTvC8YVO1XuqY',
    'https://cdn.filestackcontent.com/VcLyLmokRsizR4lBLhWA',
    'https://cdn.filestackcontent.com/ZJ4TxrhbRmW2ln14tSWq',
    'https://cdn.filestackcontent.com/kOAVtZYzSuiIvTqXz0yn',
    'https://cdn.filestackcontent.com/Rva53TeZTZmubdfyiPbR',
    'https://cdn.filestackcontent.com/KBx85vHjS6WQDO5wcumK',
    'https://cdn.filestackcontent.com/enG43FmoQhuIpoSL1jLw',
    'https://cdn.filestackcontent.com/MbPbIfcNT8C0sohcUBBS',
    'https://cdn.filestackcontent.com/E6cL65QT6KlCOolAxxQg',
    'https://cdn.filestackcontent.com/ujmi2bFmSUWGXGx5Nb37',
    'https://cdn.filestackcontent.com/fCUuL9n0RAKfnVvqaCyP'
  ]

  product_image = [
    'https://i.imgur.com/XB1XDJN.jpg',
    'https://i.imgur.com/vVKQE4e.jpg',
    'https://i.imgur.com/Z0PEKU9.jpg',
    'https://i.imgur.com/hJwcGHP.jpg',
    'https://i.imgur.com/RgYfEN7.jpg',
    'https://i.imgur.com/0nG3Rtu.jpg',
    'https://i.imgur.com/iv2XTGn.jpg',
    'https://i.imgur.com/etlgfx5.jpg',
    'https://i.imgur.com/xoUEhIt.jpg',
    'https://i.imgur.com/IpnrUu0.jpg',
    'https://i.imgur.com/i41xJV1.jpg',
    'https://i.imgur.com/kXk4YyT.jpg',
    'https://i.imgur.com/iKPou5t.jpg',
    'https://i.imgur.com/J1EDLLi.jpg',
    'https://i.imgur.com/d5LBdoq.jpg',
    'https://i.imgur.com/suumNuT.jpg',
    'https://i.imgur.com/AZfLI9D.jpg',
    'https://i.imgur.com/4RC9kz2.jpg',
    'https://i.imgur.com/VoDFK33.jpg',
    'https://i.imgur.com/RSFvw03.jpg',
    'https://i.imgur.com/6MhUS46.jpg',
    'https://i.imgur.com/aCkfHkZ.jpg',
    'https://i.imgur.com/sDne5Q1.jpg',
    'https://i.imgur.com/kzc5s65.jpg',
    'https://i.imgur.com/xjjgSnP.jpg',
    'https://i.imgur.com/orU37sP.jpg',
    'https://i.imgur.com/fI1C8IM.jpg',
    'https://i.imgur.com/18q36bH.jpg'
  ]

  task fake_all: :environment do
    Rake::Task['dev:fake_users'].execute
    Rake::Task['db:seed'].execute
    Rake::Task['dev:fake_designers'].execute
    Rake::Task['dev:fake_products'].execute
    Rake::Task['fake_inventories'].execute
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
      Designer.create!(
        name: FFaker::Name.first_name,
        brandname: FFaker::Lorem.word,
        description: FFaker::Lorem::sentence(10),
        image: designer_image[i],
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
      Product.create!(
        name: FFaker::Lorem.word,
        description: FFaker::Lorem.phrase,
        price: rand(200..500),
        thirtydays_status: false,
        designer_id: Designer.all.sample.id,
        image: product_image.sample,
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
        image: product_image.sample,
        category_id: Category.all.sample.id
      )
    end
    puts "have created fake products"
    puts "now you have #{Product.count} products data"
  end

  task fake_inventories: :environment do
    Inventory.destroy_all
    Product.all.each do |product|
      3.times do |i|
        color = Color.all.sample
        size = Size.all.sample
        Inventory.create!(
          amount: rand(2..5),
          product_id: product.id,
          color_id: color.id,
          size_id: size.id,
          color_name: color.name,
          size_name: size.name
        )
      end
    end
    puts "have created fake inventories"
    puts "now you have #{Inventory.count} inventories data"
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