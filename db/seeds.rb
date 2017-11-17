# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cocktail.delete_all

urls = ["https://cdn.liquor.com/wp-content/uploads/2015/03/hub_classic_cocktail_margarita.jpg",
  "https://cdn.liquor.com/wp-content/uploads/2015/03/hub_classic_cocktail_bloodymary.jpg",
  "https://www.shape.com/sites/shape.com/files/food-and-wine-cocktail-700x700_0.jpg",
  "http://cdn-image.myrecipes.com/sites/default/files/styles/4_3_horizontal_-_1200x900/public/image/recipes/su/08/07/blue-cocktail-su-1010551-x.jpg?itok=xceDw_df"]
# has_attachement :photo

10.times do
  url = urls.sample
  cocktail = Cocktail.new(name: Faker::Beer.hop)
  cocktail.save!
  cocktail.photo_url = url # Upload happens here
end

puts "Seeded OK"
