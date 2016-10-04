class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :spot_id
      t.text :body

      t.timestamps
    end
    add_index :comments, :spot_id
  end
end
