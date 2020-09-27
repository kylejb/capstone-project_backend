class MeteorologicalDatumSerializer < ApplicationSerializer
  attributes :recorded_data_at, :wind_dir, :wind_speed, :wind_gust, :wave_height, :dom_wave_period, :avg_wave_period, :wave_dir, :sea_pressure, :air_temp, :sea_temp, :dewpoint_temp, :station_visibility, :pressure_tendency, :tide 

  #? investigate performant improvements (e.g., :includes) 
  belongs_to :buoy
end
