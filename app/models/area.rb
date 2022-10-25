class Area < ActiveRecord::Base

    has_and_belongs_to_many :supermarkets

    after_initialize :destring_adjacent

    def destring_adjacent
        adjacent_zipcodes.split.map{|el| el.to_i}
    end

end