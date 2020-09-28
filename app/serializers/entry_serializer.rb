class EntrySerializer < ApplicationSerializer
  attributes :id, :entry, :session_start_time, :wave_quality
  belongs_to :beach
  belongs_to :buoy

  # def beach
  #   ActiveModel::SerializableResource.new(object.beach, each_serializer: BuoySerializer)
  # end
end
