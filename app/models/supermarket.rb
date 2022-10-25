class Supermarket < ActiveRecord::Base

    has_many :commodities
    has_and_belongs_to_many :areas
    
    after_initialize :assign_supermarkets

    def assign_supermarkets
        for a in Area.all
            if self.zipcode == a.zipcode
                self.areas << a
            elsif a.destring_adjacent.include?(self.zipcode)
                self.areas << a
            end
        end
    end

    # get a hash of the avg prices
    def self.get_avg_prices
        price_dict = {}
        for c in self.first.commodities
            price_dict["#{c.amount} #{c.name}"] = Commodity.avg_price(c.name, c.amount)
        end
        return price_dict
    end

    def compare_prices
        for c in self.commodities
            price_diff = c.price - Supermarket.get_avg_prices["#{c.amount} #{c.name}"]
            if price_diff < 0
                puts "#{c.amount} #{c.name} costs #{-price_diff} less than the average here"
            else 
                puts "#{c.amount} #{c.name} costs #{price_diff} more than the average here"
            end
        end
    end

    def price_index
        sum = 0
        for c in self.commodities
            sum += c.price - Supermarket.get_avg_prices["#{c.amount} #{c.name}"]
            puts sum
        end
        return sum/self.commodities.size
    end
end