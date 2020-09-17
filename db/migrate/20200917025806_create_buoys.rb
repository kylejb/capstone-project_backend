class CreateBuoys < ActiveRecord::Migration[6.0]
  def change
    create_table :buoys do |t|
      t.string :station_code
      t.string :station_name
      t.string :station_owner
      t.float :longitude
      t.float :latitude
      t.string :wind_dir
      t.string :wind_speed
      t.string :wind_gust
      t.string :wave_height
      t.string :dom_wave_period
      t.string :avg_wave_period
      t.string :wave_dir
      t.string :sea_pressure
      t.string :air_temp
      t.string :sea_temp
      t.string :tide

      t.timestamps
    end
  end
end
