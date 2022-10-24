class CreateCommodities < ActiveRecord::Migration[6.1]
  def change
    create_table :commodities do |t|
      t.integer :supermarket_id
      t.string :name
      t.string :amount
      t.float :price
    end
  end
end
