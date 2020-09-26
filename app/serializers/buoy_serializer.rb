class BuoySerializer < ActiveModel::Serializer
  attributes :id, :station_code, :station_name, :longitude, :latitude
end
