# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Category

Category.destroy_all

category_list = [
  { name: "上衣" },
  { name: "洋裝" },
  { name: "襯衫.罩衫" },
  { name: "外套" },
  { name: "短夾克" },
  { name: "大衣" },
  { name: "褲子" },
  { name: "裙子" },
  { name: "T恤.剪裁上衣" },
  { name: "襪類" },
  { name: "包包" }
]


# Size

Size.destroy_all

size_list = [
  { name: "S" },
  { name: "M" },
  { name: "L" },
  { name: "XL" },
  { name: "XXL" },
  { name: "XXL" },
  { name: "XXXL" },
  { name: "USA 5"},
  { name: "USA 5.5" },
  { name: "USA 6" },
  { name: "USA 6.5" },
  { name: "USA 7" },
  { name: "USA 7.5" },
  { name: "USA 8" },
  { name: "USA 8.5" },
  { name: "USA 9"},
  { name: "USA 9.5" },
  { name: "USA 10" },
  { name: "USA 10.5" },
  { name: "USA 11" },
  { name: "USA 11.5" },
  { name: "USA 12" },
  { name: "USA 12.5" },
  { name: "USA 13"},
  { name: "22 CM"},
  { name: "24 CM" },
  { name: "26 CM" },
  { name: "28 CM" },
  { name: "30 CM" },
  { name: "32 CM" },
  { name: "34 CM" },
  { name: "36 CM" },
  { name: "38 CM"},
  { name: "40 CM" },
  { name: "42 CM" },
  { name: "44 CM" },
  { name: "46 CM" }
]

size_list.each do |size|
  Size.create( name: size[:name] )
end
puts "Size created!"

User.create(
  email: "root@example.com",
  password: "12345678",
  name: "test",
  role: "admin"
)
puts "admin has created"


category_list.each do |category|
  Category.create( name: category[:name] )
end
puts "Category created!"