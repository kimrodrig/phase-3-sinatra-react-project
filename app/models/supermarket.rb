class Supermarket < ActiveRecord::Base

    has_many :commodities
    
    # def self.price_index
    #     for commodity in self.commodities
    #         self.com
    #     end
    # end
end