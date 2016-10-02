class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :address, null: false
      t.string :time_limit

      t.timestamps
    end
  end
end
