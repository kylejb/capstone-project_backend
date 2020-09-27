class UserSerializer < ActiveModel::Serializer
  # beaches == favorite_beaches
  attributes :id, :name, :email, :favorite_beaches

  # def beaches
  #   ActiveModel::SerializableResource.new(object.beaches, each_serializer: BeachSerializer)
  # end
end
