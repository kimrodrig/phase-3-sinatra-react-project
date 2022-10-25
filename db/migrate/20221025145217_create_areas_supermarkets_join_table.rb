class CreateAreasSupermarketsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :areas, :supermarkets
  end
end
