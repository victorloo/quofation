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
  { name: "白色", hexcode: "FFFFFF" },
  { name: "黑色", hexcode: "000000" },
  { name: "紅色", hexcode: "FF0000" },
  { name: "水藍", hexcode: "7FFFD4" },
  { name: "亮橘", hexcode: "FF4500" },
  { name: "寶藍", hexcode: "4169E1" },
  { name: "鮮黃", hexcode: "FFFF00" },
  { name: "中粉", hexcode: "FF69B4" },
  { name: "淺灰", hexcode: "D3D3D3" },
  { name: "天空藍", hexcode: "87CEEB" },
  { name: "深藍", hexcode: "00008B" },
  { name: "紫色", hexcode: "800080" },
  { name: "紫紅", hexcode: "FF00FF" },
  { name: "深橘", hexcode: "FF8C00" },
  { name: "亮綠", hexcode: "00FF00" },
  { name: "淺紫", hexcode: "9400D3" },
  { name: "橘色", hexcode: "FFA500" },
  { name: "湖水藍", hexcode: "B0E0E6" },
  { name: "暗紅", hexcode: "8B0000" },
  { name: "明黃", hexcode: "FAFAD2" },
  { name: "粉紫", hexcode: "EE82EE" },
  { name: "中藍", hexcode: "0000CD" },
  { name: "粉色", hexcode: "FFC0CB" },
  { name: "粉桃", hexcode: "FFB6C1" },
  { name: "淺綠", hexcode: "90EE90" },
  { name: "棕色", hexcode: "A52A2A" },
  { name: "淺黃", hexcode: "FFFFE0" },
  { name: "軍綠", hexcode: "6B8E23" },
  { name: "酒紅", hexcode: "722F37" },
  { name: "卡其", hexcode: "F0E68C" } 
]

color_list.each do |color|
  Color.create( 
    name: color[:name],
    hexcode: color[:hexcode]
  )
end
puts "Category created!"

# Default Admin

User.create(
  email: "root@example.com",
  password: "12345678",
  name: "test",
  role: "admin"
)
puts "admin has created"
