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
  { name: "Tops" },
  { name: "Dress" },
  { name: "Shirt" },
  { name: "Jacket" },
  { name: "Short Jacket" },
  { name: "Coat" },
  { name: "Pants" },
  { name: "Skirt" },
  { name: "Tshirt" },
  { name: "Socks" },
  { name: "Bags" }
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

# Default Admin

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
  image: "https://cdn.filestackcontent.com/bMQHxRatQVyak8liIzsm",
  user_id: 1
  )
puts "Default Designer Lato has created"

# Default Product
Product.create(
  name: 'V sign',
  description: "Some days you get the bear, and some days the bear gets you.",
  price: 850,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/lypFCItUShKZ51cWbJdZ",
  add_to_cart_count: 15,
  designer_id: 1,
  category_id: 2
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

# Default Designer 2
Designer.create(
  name: "Jason Vitcor",
  brandname: "Dreamer",
  description: "Dream as you can.",
  image: "https://cdn.filestackcontent.com/erQpNfJAQS63Zs0BbUab",
  user_id: 1
)
puts "Default Designer 1 Jason has created"

# Default Product 2
Product.create(
  name: 'Flyer',
  description: "Fly high, Dream high",
  price: 1250,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/GRj4TauOSO7ADJYJ40aj",
  add_to_cart_count: 22,
  designer_id: 2,
  category_id: 2
)
puts "Default Product Flyer sign has created"


# Default Designer 3
Designer.create(
  name: "Vivian Lo",
  brandname: "Queen",
  description: "A king next to a Queen",
  image: "https://cdn.filestackcontent.com/L0cAulB1QFOfBLmu67jC",
  user_id: 2
)
puts "Default Designer 3 Vivian has created"

# Default Product 3
Product.create(
  name: 'Soft',
  description: "Comfortable and easy to dress",
  price: 2250,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/2bBe8k9nRXac2U24oLQ5",
  add_to_cart_count: 24,
  designer_id: 3,
  category_id: 2
)
puts "Default Product soft sign has created"


# Default Designer 4
Designer.create(
  name: "Karry Kim",
  brandname: "KKOKK",
  description: "Kick Kick Out Kick Kick",
  image: "https://cdn.filestackcontent.com/yfbEVp1RZGgQe77WaJuP",
  user_id: 3
)
puts "Default Designer Karry Kim has created"

# Default Product 4
Product.create(
  name: 'Kick Vol',
  description: "Volumn up",
  price: 3150,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/S0BltFvQCqvQwKGYPGxD",
  add_to_cart_count: 31,
  designer_id: 4,
  category_id: 7
)
puts "Default Product kick vol sign has created"



# Default Designer 5
Designer.create(
  name: "Denny Chen",
  brandname: "QDennyQ",
  description: "Don't cry Denny",
  image: "https://cdn.filestackcontent.com/WFYQ1naT82sCXStLqYuw",
  user_id: 4
)
puts "Default Designer Denny has created"

# Default Product 5
Product.create(
  name: 'QQQQQQQ',
  description: "QQ cat",
  price: 2850,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/srlvrsgSzvaaXOH3AU8g",
  add_to_cart_count: 31,
  designer_id: 5,
  category_id: 7
)
puts "Default Product QQQQQQQ sign has created"


# Default Designer 6
Designer.create(
  name: "Doris Dun",
  brandname: "Doris",
  description: "Doris 5 champs",
  image: "https://cdn.filestackcontent.com/fS9kzPEwQqyYcanWNN9S",
  user_id: 6
)
puts "Default Designer Tim Duncan has created"

# Default Product 6
Product.create(
  name: '21',
  description: "21",
  price: 2980,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/VsbuXnLR72fyty2CFKNg",
  add_to_cart_count: 14,
  designer_id: 6,
  category_id: 7
)
puts "Default Product 21 sign has created"


# Default Designer 7
Designer.create(
  name: "Shelly",
  brandname: "Shiiiiiiih",
  description: "Shih, don't make a sound",
  image: "https://cdn.filestackcontent.com/mVt16KsrRJKA79420VYw",
  user_id: 7
)
puts "Default Designer Shelly has created"

# Default Product 7
Product.create(
  name: 'Sh!!!!!!h',
  description: "!!",
  price: 1980,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/KF3ExWydT9CrPJ5oGaZC",
  add_to_cart_count: 9,
  designer_id: 7,
  category_id: 1
)
puts "Default Product Sh!!!!!h sign has created"

# Default Designer 8
Designer.create(
  name: "Dr. Paper",
  brandname: "$ $ bill yo",
  description: "Shih, don't make a sound",
  image: "https://cdn.filestackcontent.com/feb2C88MTrmQJ6AIMKkq",
  user_id: 8
)
puts "Default Designer Dr. paper has created"

# Default Product 8
Product.create(
  name: 'Pepper',
  description: "$$",
  price: 1380,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/kdgTg1jTliUO3RgXCgeh",
  add_to_cart_count: 19,
  designer_id: 8,
  category_id: 1
)
puts "Default Product Pepper sign has created"

# Default Designer 9
Designer.create( 
  name: "Cris Over",
  brandname: "XoverX",
  description: "Cross Over",
  image: "https://cdn.filestackcontent.com/y7KKELPS9WXxGKEmwXeA",
  user_id: 9
)
puts "Default Designer Cris Over has created"

# Default Product 9
Product.create(
  name: 'Xmen',
  description: "Wolve",
  price: 1380,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/ECfEIwWARaOmVrkL5VcF",
  add_to_cart_count: 20,
  designer_id: 9,
  category_id: 1
)
puts "Default Product Xmen sign has created"

# Default Designer 10
Designer.create( 
  name: "Meggie M",
  brandname: "Lady M",
  description: "Make a dress for women",
  image: "https://cdn.filestackcontent.com/5Yrbj7PfQ1S3j8E0MOnS",
  user_id: 10
)
puts "Default Designer Meggie has created"

# Default Product 10
Product.create(
  name: 'Slim Coat',
  description: "Make you slim",
  price: 2380,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/4EaYjczQTCUqLgIftJ1y",
  add_to_cart_count: 10,
  designer_id: 10,
  category_id: 6
)
puts "Default Product Slim Coat has created"

# Default Product 10
Product.create(
  name: 'Slim Skirt',
  description: "Make you slim",
  price: 1980,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/oShpLs6NRnyBznUYQrtI",
  add_to_cart_count: 25,
  designer_id: 10,
  category_id: 8
)
puts "Default Product Slim Skirt has created"

# Default Designer 11
Designer.create( 
  name: "Jacky Liq",
  brandname: "Dark as night",
  description: "Liqued",
  image: "https://cdn.filestackcontent.com/YZMpE2cuTzGeQdVjVs8E",
  user_id: 11
)
puts "Default Designer Jacky has created"

# Default Product 11
Product.create(
  name: 'Blue Coat',
  description: "Mem and women both could wear",
  price: 3480,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/wRMk3elhQwuhQbk0XWV0",
  add_to_cart_count: 8,
  designer_id: 11,
  category_id: 6
)
puts "Default Product Blue Coat has created"

# Default Product 11
Product.create(
  name: 'Worm coat',
  description: "Better to wear during winter",
  price: 4080,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/ferfUzssRLepq0hpCqAg",
  add_to_cart_count: 7,
  designer_id: 11,
  category_id: 6
)
puts "Default Product Worm Coat has created"

# Default Designer 12
Designer.create( 
  name: "Bob Chen",
  brandname: "Design from a human",
  description: "Think from human",
  image: "https://cdn.filestackcontent.com/vukTKzrTSKqEjTSoEMFP",
  user_id: 12
)
puts "Default Designer Bob Chen has created"

# Default Product 12
Product.create(
  name: 'Pink Skirt',
  description: "women could wear",
  price: 1680,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/RUAlx33XTZqrdTpImYLe",
  add_to_cart_count: 14,
  designer_id: 12,
  category_id: 8
)
puts "Default Product Pink Skirt has created"

# Default Product 12
Product.create(
  name: '$kirt',
  description: "Cheap one but very comfortable",
  price: 980,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/oPjrcWVlQo8LZFrDXbYV",
  add_to_cart_count: 37,
  designer_id: 12,
  category_id: 8
)
puts "Default Product $kirt has created"

# Default Designer 13
Designer.create( 
  name: "Vicky Lo",
  brandname: "Nature",
  description: "Design is my nature",
  image: "https://cdn.filestackcontent.com/xlHSXSQsSCao2shXtlZh",
  user_id: 13
)
puts "Default Designer Vicky Lo has created"

# Default Product 13
Product.create(
  name: 'Red coat',
  description: "Red as fire",
  price: 4680,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/yTkecPu8QFawzTQuctNQ",
  add_to_cart_count: 8,
  designer_id: 13,
  category_id: 6
)
puts "Default Product Red coat has created"

# Default Product 13
Product.create(
  name: 'White ice',
  description: "Wear in Ice",
  price: 3290,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/efpNblltSlyOl6pZGtZ1",
  add_to_cart_count: 11,
  designer_id: 13,
  category_id: 6
)
puts "Default Product White ice has created"

# Default Designer 14
Designer.create( 
  name: "Roger Q",
  brandname: "IceCream",
  description: "Color is what I beleive",
  image: "https://cdn.filestackcontent.com/eOQET2HvQq7J2r1rybGb",
  user_id: 14
)
puts "Default Designer Roger Q has created"

# Default Product 14
Product.create(
  name: 'Army coat',
  description: "camp",
  price: 2490,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/5NvmteNQQmgek5MqPPEh",
  add_to_cart_count: 16,
  designer_id: 14,
  category_id: 8
)
puts "Default Product Army coat has created"

# Default Product 14
Product.create(
  name: 'Slim Blue Shirt',
  description: "Slim Slim Slim",
  price: 2290,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/dvWBBdliRjuuGRTboV6R",
  add_to_cart_count: 27,
  designer_id: 14,
  category_id: 6
)
puts "Default Product Slim Blue Skirt has created"

# Default Designer 15
Designer.create( 
  name: "Babara Dean",
  brandname: "Wile Wild West",
  description: "West coast",
  image: "https://cdn.filestackcontent.com/2qwZHcMjTemvBoMnEyWN",
  user_id: 15
)
puts "Default Designer Babara Dean has created"

# Default Product 15
Product.create(
  name: 'Orange',
  description: "Orange could make you look slim",
  price: 2580,
  thirtydays_status: true,
  image: "https://cdn.filestackcontent.com/8CHhnXGnSVeNy6UyGS9q",
  add_to_cart_count: 24,
  designer_id: 15,
  category_id: 8
)
puts "Default Product Orange has created"

