class CreateBuoyBeaches < ActiveRecord::Migration[6.0]
  def change
    create_table :buoy_beaches do |t|
      t.references :beach, null: false, foreign_key: true
      t.references :buoy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
