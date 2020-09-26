class FavoriteBeachSerializer < ActiveModel::Serializer
  attributes :id, :beach

  def beach
    ActiveModel::SerializableResource.new(object.beach, each_serializer: BeachSerializer)
  end
end
