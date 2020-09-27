class FavoriteBeachSerializer < ApplicationSerializer
  attributes :id, :name, :beach

  def beach
    ActiveModel::SerializableResource.new(object.beach, each_serializer: BeachSerializer)
  end
end
