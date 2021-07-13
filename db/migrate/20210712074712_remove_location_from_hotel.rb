class RemoveLocationFromHotel < ActiveRecord::Migration[6.1]
  def change
    remove_column :hotels, :location
  end
end
