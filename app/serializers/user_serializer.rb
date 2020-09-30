class UserSerializer < ApplicationSerializer
  # beaches == favorite_beaches
  attributes :id, :name, :email, :favorite_buoys

  # has_many :favorite_beaches do
  #   object.favorite_beaches.where(created_by: current_user)
  # end

  # has_many :entries do
  #   object.entries.where(created_by: current_user)
  # end

  # def beaches
  #   ActiveModel::SerializableResource.new(object.beaches, each_serializer: BeachSerializer)
  # end
end
