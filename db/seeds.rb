
# MVP Seed File - testing basic functionality
puts "================================"

# BuoyBeach.destroy_all
# FavoriteBeach.destroy_all
# Entry.destroy_all
# MeteorologicalDatum.destroy_all
# SpectralWaveDatum.destroy_all
# Buoy.destroy_all
# Beach.destroy_all
# User.destroy_all

puts "Successfully deleted previously seeded data from db"
puts "Seeding: Start..."

# Find a buoy and sample row of "latest" data that will eventually be harvested autonomously
buoy = Buoy.find_by(station_code: "44065")
buoy_mdata = MeteorologicalDatum.create!(wind_dir: 230, wind_speed: 1.0, wind_gust: 2.0, wave_height: 0.9, dom_wave_period: 11, avg_wave_period: 6.8, wave_dir: 114, sea_pressure: 1016.3, sea_temp: 22.1, recorded_data_at: DateTime.new(2020, 9, 17, 17, 50), buoy: buoy)


# Create beach
rockaway = Beach.create!(name: "Rockaway Beach", latitude: 40.5834115, longitude: -73.8241093)
long_beach = Beach.create!(name: "Long Beach", latitude: 40.5895, longitude: -73.6665)
# Create user
kyle = User.create!(name: "Kyle", email: "kyle@email.com", password: "password")


# Create association between a beach and user
FavoriteBeach.create!(beach: rockaway, user: kyle)
# Create association between beach and buoy
BuoyBeach.create!(buoy: buoy, beach: rockaway)
BuoyBeach.create!(buoy: buoy, beach: long_beach)
# Create association amongst beach, user, and entry
Entry.create!(user: kyle, beach: rockaway,  session_start_time: DateTime.now, session_duration: 1, entry: "Tough paddle due to cross-shore currents, but had a few memorable rides", wave_quality: "average")

puts "================================"
puts "... end"