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
  { name: "white", hexcode: "FFFFFF" },
  { name: "black", hexcode: "000000" },
  { name: "red", hexcode: "FF0000" },
  { name: "aquamarine", hexcode: "7FFFD4" },
  { name: "vermilion", hexcode: "FF4500" },
  { name: "royalBlue", hexcode: "4169E1" },
  { name: "yellow", hexcode: "FFFF00" },
  { name: "hotPink", hexcode: "FF69B4" },
  { name: "alto", hexcode: "D3D3D3" },
  { name: "seagull", hexcode: "87CEEB" },
  { name: "navyBlue", hexcode: "00008B" },
  { name: "freshEggplant", hexcode: "800080" },
  { name: "fuchsia", hexcode: "FF00FF" },
  { name: "pizazz", hexcode: "FF8C00" },
  { name: "green", hexcode: "00FF00" },
  { name: "electricViolet", hexcode: "9400D3" },
  { name: "webOrange", hexcode: "FFA500" },
  { name: "powderBlue", hexcode: "B0E0E6" },
  { name: "redBerrt", hexcode: "8B0000" },
  { name: "cornField", hexcode: "FAFAD2" },
  { name: "lavenderMagenta", hexcode: "EE82EE" },
  { name: "darkBlue", hexcode: "0000CD" },
  { name: "pink", hexcode: "FFC0CB" },
  { name: "peachPink", hexcode: "FFB6C1" },
  { name: "pastelGreen", hexcode: "90EE90" },
  { name: "nexicanRed", hexcode: "A52A2A" },
  { name: "halfYellow", hexcode: "FFFFE0" },
  { name: "oliveDrab", hexcode: "6B8E23" },
  { name: "buccaneer", hexcode: "722F37" },
  { name: "khaki", hexcode: "F0E68C" } 
]

color_list.each do |color|
  Color.create( 
    name: color[:name],
    hexcode: color[:hexcode]
  )
end
puts "Color created!"

# Admin

User.create(
  email: "root@example.com",
  password: "12345678",
  name: "test",
  role: "admin"
)
puts "admin has created"

# Default Designer
Designer.create(
  name: "Lato",
  brandname: "Roboto",
  description: "It has a mechanical skeleton and the forms are largely geometric.",
  image: "https://i.imgur.com/2Vl6IKF.jpg",
  user_id: User.all.where(role: "admin").first.id
)
puts "Default Designer Lato has created"

# Default Product
Product.create(
  name: 'V sign',
  description: "Some days you get the bear, and some days the bear gets you.",
  price: 850,
  image: 'https://i.imgur.com/d5LBdoq.jpg',
  designer_id: Designer.first.id,
  category_id: Category.find(9).id
)
puts "Default Product V sign has created"

# Default Inventories
Inventory.create(
  amount: 5,
  product_id: Product.find(1).id,
  color_id: Color.find(2).id,
  size_id: Size.find(1).id,
  color_name: "black",
  size_name: "S"
)
Inventory.create(
  amount: 3,
  product_id: Product.find(1).id,
  color_id: Color.find(2).id,
  size_id: Size.find(2).id,
  color_name: "black",
  size_name: "M"
)
puts "Default Inventory have created"