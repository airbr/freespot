class RemoveAddressFromSpot < ActiveRecord::Migration[5.0]
  def change
    remove_column :spots, :address, :string
  end
end
