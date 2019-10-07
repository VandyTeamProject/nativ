class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.input :category_id
      t.integer :place_id

      t.timestamps
    end
  end
end
