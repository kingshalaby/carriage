class CreateRealEstates < ActiveRecord::Migration[5.0]
  def change
    create_table :real_estates do |t|
      t.string :street
      t.string :city
      t.integer :zip
      t.string :state
      t.integer :beds
      t.integer :baths
      t.integer :sq_ft
      t.integer :category
      t.date :sale_date
      t.integer :price
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
