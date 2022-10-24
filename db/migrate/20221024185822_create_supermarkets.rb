class CreateSupermarkets < ActiveRecord::Migration[6.1]
  def change
    create_table :supermarkets do |t|
      t.string :name
      t.integer :zipcode
      t.float :price_index
  end
end
