class Beach < ApplicationRecord
    has_many :favorite_beaches
    has_many :buoy_beaches
    has_many :buoys, through: :buoy_beaches
    has_many :meteorological_data, through: :buoys
end
