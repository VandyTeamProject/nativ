class ChangeIntegerLimitInPlaces < ActiveRecord::Migration[5.2]
  def change
    change_column :places, :phone_number, :integer, limit: 8
  end
end
