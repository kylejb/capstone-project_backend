class FavoriteBuoy < ApplicationRecord
  belongs_to :buoy
  belongs_to :user
  #* beach will need to be created with Beach.create and associated to buoy with BuoyBeach.create on association of buoy to user (e.g., asking user for preferred beach in area of buoy)
end
