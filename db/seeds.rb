# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product_list = [
  [ "Stuart", "Stuart is playful, friendly, intelligent and funny. He is skillful at video games like his friend Dave. He can also be the most sincere and innocent out of all the minions. He also seems to have a rebellious and obstreperous attitude. He is considered to be a slacker among the other Minions, preferring to chill out and play the ukulele than listen to the rules. Also, he was said to be always hungry in Minions, such as when he attempted to eat Kevin and Bob when he was thinking of them as bananas, and even tried to eat a yellow fire hydrant in New York, also thinking it as a banana or food as well.", "", 29.90, 20 ],
  [ "Kevin", "Kevin loves to make fun of and tease people or Minions, shown when he made fun of Jerry and teases him for being a coward. He loves playing golf and cricket. In the film Minions he is the leader of the trio in search of a new master. He truly cares about the well-being of the Minion tribe (which is dependent on them having a proper master).", "", 39.90, 15 ],
  [ "Bob", "Bob is a minion who is more childish and immature than most of the other minions. He is described as a Little Brother who finds love in anything and everything, including a rat (who he named Poochy) he found in a sewer in the Minions film. He also enjoys bedtime stories and playing with his favorite stuffed teddy bear, Tim.", "", 49.90, 10 ],
  [ "Jerry", "Jerry is very sensitive as seen when Kevin teases him for being a coward. He is also easily got scared when he hear any strange noises like when he heard a noise which is only a cat looking out throught the garbage. He loves to play his guitar as seen at the beach.", "", 25.90, 10]
]

Product.delete_all
Cart.delete_all
Order.delete_all

product_list.each do |name, description, photo, price, stock|
  Product.create(name: name, description: description, photo: photo, price: price, stock: stock)
end

