class FavoriteBeachSerializer < ActiveModel::Serializer
  attributes :id, :beach

  has_many :buoys
end
