
# MVP Seed File - testing basic functionality
puts "================================"
puts "Seeding: Start..."

# Create a buoy and sample row of "latest" data that will eventually be harvested autonomously
buoy = Buoy.create!(station_code: "44065", station_name: "New York Harbor Entrance", station_owner: "National Data Buoy Center", latitude: 40.369, longitude: -73.703)  )
buoy_mdata = MeteorologicalData.create!(wind_dir: 230, wind_speed: 1.0, wind_gust: 2.0, wave_height: 0.9, dom_wave_period: 11, avg_wave_period: 6.8, wav_dir: 114, sea_pressure: 1016.3, sea_temp: 22.1, recorded_at: DateTime.new(2020, 9, 17, 17, 50))

# Create beach
rockaway = Beach.create!(name: "Rockaway Beach", latitude: 40.5834115, longitude: -73.8241093)
long_beach = Beach.create!(name: "Long Beach", latitude: 40.5895, longitude: -73.6665)
# Create user
kyle = User.create!(name: "Kyle", email: "kyle@email.com", password: "password")
# Create association between a beach and a user
FavoriteBeach.create!(beach: rockaway, user: kyle)

puts "================================"
puts "... end"