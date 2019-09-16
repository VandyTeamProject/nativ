class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name 
      t.string :address
      t.integer :phone_number
      t.text :description
      t.timestamps
    end
  end
end
