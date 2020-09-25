class AddDewpVisPtdyToMeteorologicalData < ActiveRecord::Migration[6.0]
  def change
    add_column :meteorological_data, :dewpoint_temp, :float
    add_column :meteorological_data, :station_visibility, :float
    add_column :meteorological_data, :pressure_tendency, :string
  end
end
