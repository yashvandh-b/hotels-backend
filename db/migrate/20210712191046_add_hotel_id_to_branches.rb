class AddHotelIdToBranches < ActiveRecord::Migration[6.1]
  def change
    add_column :branches, :hotel_id, :integer
    add_index :branches, :hotel_id
  end
end
