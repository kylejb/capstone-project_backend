class AddWaterqualityCurrentsAndDartToBuoys < ActiveRecord::Migration[6.0]
  def change
    add_column :buoys, :waterquality, :string
    add_column :buoys, :currents, :string
    add_column :buoys, :dart, :string
  end
end
