class AlterPlaceCityAndState < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :city, :string
    add_column :places, :state, :string
    add_column :places, :zip, :string
  end
end
