class CreateMeteorologicalData < ActiveRecord::Migration[6.0]
  def change
    create_table :meteorological_data do |t|
      t.references :buoy, null: false, foreign_key: true
      t.integer :wind_dir
      t.float :wind_speed
      t.float :wind_gust
      t.float :wave_height
      t.integer :dom_wave_period
      t.float :avg_wave_period
      t.integer :wave_dir
      t.float :sea_pressure
      t.float :air_temp
      t.float :sea_temp
      t.string :tide
      t.datetime :recorded_data_at
      
      t.timestamps
    end
  end
end
