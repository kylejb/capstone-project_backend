class Entry < ApplicationRecord
  belongs_to :user, inverse_of: :entries
  validates_presence_of :user
  belongs_to :buoy
  #* beach will need to be created with Beach.create and associated to buoy with BuoyBeach.create on association of entry to buoy+user (e.g., asking user for both beach (optional) and buoy info when creating entry)
  belongs_to :beach, optional: true
end
