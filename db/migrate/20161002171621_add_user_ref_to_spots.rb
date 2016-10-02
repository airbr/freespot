class AddUserRefToSpots < ActiveRecord::Migration[5.0]
  def change
    add_reference :spots, :user, foreign_key: true, null: false
  end
end
