class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name 
      t.string :address
      t.integer :phone_number
      t.integer :user_id
      t.text :description
      t.timestamps
    end
      add_index :places, :user_id
  end
end
