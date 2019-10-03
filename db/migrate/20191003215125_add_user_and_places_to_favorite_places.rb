class AddUserAndPlacesToFavoritePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.belongs_to :place, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
