class EntrySerializer < ActiveModel::Serializer
  attributes :id, :entry, :session_start_time, :wave_quality, :beach

  def beach
    ActiveModel::SerializableResource.new(object.beach, each_serializer: UserSerializer)
  end
end
