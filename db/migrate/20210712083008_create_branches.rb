class CreateBranches < ActiveRecord::Migration[6.1]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :location
      t.string :manager_name
      t.integer :manager_phone

      t.timestamps
    end
  end
end
