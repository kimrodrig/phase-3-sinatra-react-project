class Commodity < ActiveRecord::Base
    
    belongs_to :supermarket

    after_save :update_supermarket_price_index

    def self.avg_price name, amount
        self.where(name: name, amount: amount).average(:price).round(2)
    end

    def update_supermarket_price_index
        Supermarket.first.set_price_index
    end

end