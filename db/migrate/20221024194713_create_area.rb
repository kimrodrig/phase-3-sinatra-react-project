class CreateArea < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|
      t.integer :zipcode
      t.string :adjacent_zipcodes
    end
  end
end
