class BuoySerializer < ActiveModel::Serializer
  attributes :id, :station_code, :station_name, :meteorological_data, :spectral_wave_data
end
