puts "Creating Supermarkets..."

Supermarket.create(name: 'Whole Foods', zipcode: 10002, self.price_index)
Supermarket.create(name: 'Trader Joe\'s', zipcode: 10013, self.price_index)
Supermarket.create(name: 'Gristedes', zipcode: 10014, self.price_index)

puts "Creating Commodities..."

3.times do |i|
    Commodity.create(supermarket_id: i+1, amount: "1 dozen", name: "eggs", price: rand(2.5..8.0).round(2))
    Commodity.create(supermarket_id: i+1, amount: "1 gallon", name: "milk", price: rand(2.5..8.0).round(2))
    Commodity.create(supermarket_id: i+1, amount: "5 pounds", name: "flour", price: rand(2.5..8.0).round(2))
end


puts "Seeding done"
