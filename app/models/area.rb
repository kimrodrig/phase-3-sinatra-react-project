class Area < ActiveRecord::Base

    has_and_belongs_to_many :supermarkets

    def destring_adjacent
        adjacent_zipcodes.split.map{|el| el.to_i}
    end

    # returns cheapest supermarket first
    def self.search_by_zipcode zipcode
        if self.all.find_by(zipcode: zipcode) == nil
            puts nil
        else
            self.all.find_by(zipcode: zipcode).supermarkets.order(:price_index)
        end
    end

end