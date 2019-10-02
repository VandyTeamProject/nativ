class CreateFavoritePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_places do |t|
      t.integer :place_id
      t.integer :user_id

      t.timestamps
    end
  end
end
