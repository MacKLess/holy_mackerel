# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Review.destroy_all

product = [
  ['Arctic Cod (farmed)', 29.99, 'Best Choices', 'Excellent fish for any occassion'],
  ['Baramund (US farmed)', 33.99, 'Best Choices', 'Award winning!'],
  ['Catfish', 55.98, 'Best Choices', 'No Po Boy would be complete without it.'],
  ['Lionfish', 29.99, 'Best Choices', 'Requires a specific palate but very good for the liver.'],
  ['Sablefish (CA farmed)', 75.96, 'Best Choices', 'Exotic flavor that perfects any chowder.'],
  ['Salmon (AK & NZ)', 49.99, 'Best Choices', 'A traditional favorite that MAKES the holidays bright.'],
  ['Sardines: Pacific (CA & US)', 9.99, 'Best Choices', 'Small and packed with flavor.'],
  ['Sole (US)', 11.99, 'Best Choices', 'Great for the heart.'],
  ['Tuna: Albacore (troll, pole, and line)', 39.99, 'Best Choices', 'You know you want it!'],
  ['Cod: Pacific (CA & US)', 29.99, 'Good Alternatives', 'A delight that will grace any dinner table.'],
  ['Lingcod (CA)', 42.99, 'Good Alternatives', 'Solid fish with a strong flavor and smell.'],
  ['Mahi Mahi (Ecuador & US longline)', 19.99, 'Good Alternatives', 'Holds up on its own or in a good seafood mix.'],
  ['Salmon (CA, OR & WA wild)', 39.99, 'Good Alternatives', 'Absolutely necessary for bagel & loxs!'],
  ['Snapper (US)', 11.99, 'Good Alternatives', 'Excellent fish for any occassion.'],
  ['Squid (Chile, MX, Peru & US)', 9.99, 'Good Alternatives', 'Who does not enjoy some nice calimari with a hipster beer?'],
  ['Tuna: Albacore (US longline)', 38.98, 'Good Alternatives', 'A flavor that will remind you of childhood sack lunches.'],
  ['Tuna: Skipjack (free school, imported troll, pole and line, and US longline)', 22.99, 'Excellent choice for any seasonal gathering.'],
  ['Tuna: Yellowfin (free school, troll, pole and line, US longline)', 42.99, 'Good Alternatives', 'Suitable for sushi.'],
  ['Cod: Pacific (Japan & Russia)', 19.99, 'Avoid', 'Traditional option for fish and chips.'],
  ['Halibut: Atlantic (wild)', 69.99, 'Avoid', 'Adored by folks who usually do not like fish.'],
  ['Mahi Mahi (imported)', 25.99, 'Avoid', 'A taste of the islands.'],
  ['Salmon: Chinook (Puget Sound)', 39.99, 'Avoid', 'Special occassion fish fit to feed any Finn.'],
  ['Salmon: Coho (Columbia River)', 33.99, 'Avoid', 'Local delicacy offered only rarely due to eco impact.'],
  ['Tuna: Skipjack (imported purse seine)', 22.99, 'Avoid', 'Delightful flavor and great texture.'],
  ['Pollock (CA trawl)', 18.99, 'Avoid', 'Perfect for serving with a nice white sauce and a chianti.']
]
productnames = []
product.each do |product_name, product_cost, product_guide, product_notes|
  productnames.push(product_name)
  Product.create(name: product_name, cost: product_cost, guide: product_guide, notes: product_notes)
end

end
