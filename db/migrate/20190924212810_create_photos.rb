class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :place_id
      

      t.timestamps
    end

    add_index :photos, :place_id
  end
end
