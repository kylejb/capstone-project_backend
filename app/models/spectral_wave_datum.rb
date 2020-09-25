class SpectralWaveDatum < ApplicationRecord
  belongs_to :buoy
  # validates_uniqueness_of :recorded_data_at, scope: [:buoy]
end
