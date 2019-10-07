class AddColumnsToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :category_id, :string
  end
end
