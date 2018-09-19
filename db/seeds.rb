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


category_list.each do |category|
  Category.create( name: category[:name] )
end
puts "Category created!"


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

# Color

Color.destroy_all

color_list = [
  { name: "白色" },
  { name: "黑色" },
  { name: "紅色" },
  { name: "水藍" },
  { name: "亮橘" },
  { name: "寶藍" },
  { name: "鮮黃" },
  { name: "中粉" },
  { name: "淺灰" },
  { name: "天空藍" },
  { name: "深藍" },
  { name: "紫色" },
  { name: "紫紅" },
  { name: "淺橘" },
  { name: "亮綠" },
  { name: "淺紫" },
  { name: "橘色" },
  { name: "湖水藍" },
  { name: "暗紅" },
  { name: "明黃" },
  { name: "粉紫" },
  { name: "中藍" },
  { name: "粉色" },
  { name: "粉桃" },
  { name: "淺綠" },
  { name: "棕色" },
  { name: "淺黃" },
  { name: "軍綠" },
  { name: "酒紅" },
  { name: "卡其" } 
]

color_list.each do |color|
  Color.create( name: color[:name] )
end
puts "Category created!"

# Inventory

Inventory.destroy_all

inventory_list = [
  { name: "1" },
  { name: "2" },
  { name: "3" },
  { name: "4" },
  { name: "5" },
  { name: "6" },
  { name: "7" },
  { name: "8" },
  { name: "9" },
  { name: "10" },
  { name: "11" },
  { name: "12" },
  { name: "13" },
  { name: "14" },
  { name: "15" },
  { name: "16" },
  { name: "17" },
  { name: "18" },
  { name: "19" },
  { name: "20" },
  { name: "21" },
  { name: "22" },
  { name: "23" },
  { name: "24" },
  { name: "25" },
  { name: "26" },
  { name: "27" },
  { name: "28" },
  { name: "29" },
  { name: "30" }
]

inventory_list.each do |inventory|
  Inventory.create( name: inventory[:name] )
end
puts "Inventory created!"

User.create(
  email: "root@example.com",
  password: "12345678",
  name: "test",
  role: "admin"
)
puts "admin has created"
