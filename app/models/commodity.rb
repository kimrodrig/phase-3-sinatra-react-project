class Commodity < ActiveRecord::Base
    
    belongs_to :supermarket

    def self.avg_price name, amount
        self.where(name: name, amount: amount).average(:price).round(2)
    end

end