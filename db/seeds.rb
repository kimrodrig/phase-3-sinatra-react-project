puts "Creating Supermarkets..."

Supermarket.create(name: 'Whole Foods', zipcode: 10002)
Supermarket.create(name: 'Trader Joe\'s', zipcode: 10013)
Supermarket.create(name: 'Gristedes', zipcode: 10014)

puts "Creating Commodities..."

3.times do |i|
    Commodity.create(supermarket_id: i+1, amount: "1 dozen", name: "eggs", price: rand(2.5..8.0).round(2))
    Commodity.create(supermarket_id: i+1, amount: "1 gallon", name: "milk", price: rand(2.5..8.0).round(2))
    Commodity.create(supermarket_id: i+1, amount: "5 pounds", name: "flour", price: rand(2.5..8.0).round(2))
end

puts "Area DB"

Area.create(zipcode: 10002, adjacent_zipcodes: "10038 10013 10012 10003 10009")
Area.create(zipcode: 10003, adjacent_zipcodes: "10002 10009 10010 10011 10012")
# Area.create(zipcode: 10004, adjacent_zipcodes: [10006, 10005])
# Area.create(zipcode: 10005, adjacent_zipcodes: [10004, 10006, 10038])
# Area.create(zipcode: 10006, adjacent_zipcodes: [10004, 10005, 10038, 10048, 10007])
# Area.create(zipcode: 10007, adjacent_zipcodes: [10048, 10006, 10038, 10013])
# Area.create(zipcode: 10009, adjacent_zipcodes: [10002, 10003, 10010])
# Area.create(zipcode: 10012, adjacent_zipcodes: [10002, 10003, 10011, 10013, 10014])
# Area.create(zipcode: 10013, adjacent_zipcodes: [10002, 10007, 10012, 10014, 10038])
# Area.create(zipcode: 10014, adjacent_zipcodes: [10011, 10012, 10014])
# Area.create(zipcode: 10038, adjacent_zipcodes: [10002, 10005, 10006, 10007, 10013])
# Area.create(zipcode: 10048, adjacent_zipcodes: [10006, 10007])


puts "Seeding done"


#render price indices