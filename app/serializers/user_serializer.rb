class UserSerializer < ActiveModel::Serializer
  # beaches == favorite_beaches
  attributes :id, :name, :email#, :favorite_beaches

  # experimenting with deep nesting
  # def entries
  #   ActiveModel::SerializableResource.new(object.entries, each_serializer: EntrySerializer)
  # end

  # def beaches
  #   ActiveModel::SerializableResource.new(object.beaches, each_serializer: BeachSerializer)
  # end
end
