class BeachSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude 

  has_many :buoys
end
