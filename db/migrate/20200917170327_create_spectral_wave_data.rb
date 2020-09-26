class CreateSpectralWaveData < ActiveRecord::Migration[6.0]
  def change
    create_table :spectral_wave_data do |t|
      t.references :buoy, null: false, foreign_key: true
      t.string :swell_dir
      t.string :swell_height
      t.string :swell_period
      t.string :wind_wave_dir
      t.string :wind_wav_height
      t.string :overall_height_and_period
      t.string :steepness

      t.timestamps
    end
  end
end
