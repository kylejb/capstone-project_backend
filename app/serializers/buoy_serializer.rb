class BuoySerializer < ApplicationSerializer
  attributes :id, :station_code, :station_name, :longitude, :latitude

  #? dig into how this works and how SQL performance is affected
  # has_many :meteorological_data, key: :recent_meteorological_data do
  #   byebug
  #   self.object.meteorological_data.first(1)
  # end
end
