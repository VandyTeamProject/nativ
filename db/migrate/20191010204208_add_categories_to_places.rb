class AddCategoriesToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :category, :string
  end
end
