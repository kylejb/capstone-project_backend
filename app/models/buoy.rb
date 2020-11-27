class Buoy < ApplicationRecord
    has_many :meteorological_data
    has_many :spectral_wave_data

    has_many :buoy_beaches
    has_many :beaches, through: :buoy_beaches

    has_many :entries
end
