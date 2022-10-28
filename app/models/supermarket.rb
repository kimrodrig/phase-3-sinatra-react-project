class Supermarket < ActiveRecord::Base

    has_many :commodities
    has_and_belongs_to_many :areas

    after_create :assign_areas, :set_price_index

    def self.ordered_supermarkets
        return self.order(:price_index)
    end

    def assign_areas
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
        array_of_strings = []
        for c in self.commodities
            price_diff = c.price - Supermarket.get_avg_prices["#{c.amount} #{c.name}"]
            if price_diff < 0
                array_of_strings << "#{c.amount} #{(c.name == 'eggs' ? '' : 'of ')}#{c.name} cost#{(c.amount[0].to_i > 1) ? '' : 's'} $#{-price_diff} less than the average here."
            else 
                array_of_strings << "#{c.amount} #{(c.name == 'eggs' ? '' : 'of ')}#{c.name} cost#{(c.amount[0].to_i > 1) ? '' : 's'} $#{price_diff} more than the average here."
            end
        end
        return array_of_strings
    end

    def price_index
        if self.commodities.size > 0
            sum = 0
            for c in self.commodities
                sum += c.price - Supermarket.get_avg_prices["#{c.amount} #{c.name}"]
                puts sum
            end
            return (sum/self.commodities.size).round(4)
        end
    end

    #reset every price index
    def set_price_index
        for s in Supermarket.all
            s.update(price_index: s.price_index)
        end
    end


    #check if franchise already exists
    def self.franchise_exists? name
        if Supermarket.all.find_by(name: name)
            return true
        else 
            return false
        end
    end

    #update according to other franchise
    def update_self_to_franchise
        if Supermarket.franchise_exists? self.name
            s = Supermarket.find_by(name: self.name)
            self.commodities.first.update(price: s.commodities.first.price)
            self.commodities.second.update(price: s.commodities.second.price)
            self.commodities.third.update(price: s.commodities.third.price)
            self.set_price_index
        end
    end

    def update_other_locations_to_self
        for s in Supermarket.all do
            if s.name == self.name
                s.commodities.first.update(price: self.commodities.first.price)
                s.commodities.second.update(price: self.commodities.second.price)
                s.commodities.third.update(price: self.commodities.third.price)
            end
        end
    end

    #create a completely new supermarket
    def self.new_supermarket(name, zipcode, price_of_eggs, price_of_milk, price_of_flour)
        s = Supermarket.create(name: name, zipcode: zipcode)
        s.commodities << Commodity.create(name: "eggs", amount: "1 dozen", price: price_of_eggs)
        s.commodities << Commodity.create(name: "milk", amount: "1 gallon", price: price_of_milk)
        s.commodities << Commodity.create(name: "flour", amount: "5 pounds", price: price_of_flour)
        s.update_other_locations_to_self
        s.set_price_index
    end

    #update prices at a supermarket
    def update_prices(price_of_eggs, price_of_milk, price_of_flour)
        self.commodities.first.update(price: price_of_eggs)
        self.commodities.second.update(price: price_of_milk)
        self.commodities.third.update(price: price_of_flour)
    end

    #destroy supermarket and its commodities
    def delete
        for c in self.commodities do 
            c.destroy
        end
        self.destroy
    end

end