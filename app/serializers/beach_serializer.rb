class BeachSerializer < ApplicationSerializer
  attributes :id, :name, :latitude, :longitude

  #? look into how to control when this relational attribute gets hit during rendering process
  # toggling this view to specific routes to can support frontend efficiency
  has_many :buoys, key: :recent_meteorological_data do
    newArr = []
    self.object.buoys.each do |buoy_obj|
      newObj = {}
      newObj[buoy_obj.station_code] = buoy_obj.meteorological_data.first(5)
      newArr.push(newObj)
    end
    # station_code => most recent five weather results in db
    newArr[0]
  end
end
