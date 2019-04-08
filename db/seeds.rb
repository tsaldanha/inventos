# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product_list = [
  [ "Minion 1", "Boneco dos Minions 1", "", 29.90, 10 ],
  [ "Minion 2", "Boneco dos Minions 2", "", 39.90, 10 ],
  [ "Minion 3", "Boneco dos Minions 3", "", 49.90, 10 ]
]

product_list.each do |name, description, photo, price, stock|
  Product.create(name: name, description: description, photo: photo, price: price, stock: stock)
end

