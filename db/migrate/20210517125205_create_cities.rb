class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :country
      t.integer :price
      t.string :main_monument
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
