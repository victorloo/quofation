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