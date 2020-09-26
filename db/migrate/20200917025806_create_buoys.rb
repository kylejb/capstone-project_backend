class CreateBuoys < ActiveRecord::Migration[6.0]
  def change
    create_table :buoys do |t|
      t.string :station_code
      t.string :station_name
      t.string :station_owner
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
