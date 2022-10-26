class Area < ActiveRecord::Base

    has_and_belongs_to_many :supermarkets

    def destring_adjacent
        adjacent_zipcodes.split.map{|el| el.to_i}
    end

    def self.search_by_zipcode zipcode
        self.all.find_by(zipcode: zipcode).supermarkets
    end

end