class AddColumnsToSpot < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :latitude, :float
    add_column :spots, :longitude, :float
    add_column :spots, :address, :string
    add_column :spots, :description, :text
    add_column :spots, :title, :string
  end
end
