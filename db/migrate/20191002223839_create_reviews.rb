class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :message
      t.integer :user_id
      t.integer :place_id
      t.timestamps
    end
      add_index :reviews, [:user_id, :place_id]
      add_index :reviews, :place_id
  end
end
