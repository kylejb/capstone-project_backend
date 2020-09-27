require 'nokogiri'
require 'net/http'
require 'open-uri'

module NdbcScraper

    def self.get_station_xml
        active_buoys_xml = URI.parse("https://www.ndbc.noaa.gov/activestations.xml")

        ndbc_data = Net::HTTP.get(active_buoys_xml)
        xml = Nokogiri.XML(ndbc_data)

        stations = xml.xpath("//station")

        stations.each do |station|
           Buoy.create!(station_code: station[:id], station_name: station[:name], station_owner: station[:owner], latitude: station[:lat], longitude: station[:lon], pgm: station[:pgm], type: station[:type], elev: station[:elev], met: station[:met], dart: station[:dart], currents: station[:currents], waterquality: station[:waterquality] )
        end
    end

    # Web crawler to extract buoy specific information
    def self.get_station_links
        station_list_url ='https://www.ndbc.noaa.gov/to_station.shtml'
        html = URI.open(station_list_url)
        doc = Nokogiri::HTML(html)

        station_pages = doc.css('pre a').map { |link| link['href'] }
    end

    def self.realtime_meteorological_data(station_id)
        realtime_url = "https://www.ndbc.noaa.gov/data/realtime2/#{station_id}.txt"
        begin
            content = URI.open(realtime_url).read
            arr = []
            content.each_line { |row| arr.push(row)}
            self.fetch_data(station_id, arr)
        rescue
            puts "404"
            nil
        end
    end

    def self.parse_realtime_meteorological_data(data)
        data.map { |row| row.split(" ") }#.transpose
    end

    def self.fetch_data(station_id, data)
        buoy = Buoy.find_by(station_code: station_id)
        data_arr_table = self.parse_realtime_meteorological_data(data)
        data_arr_table.shift(2)
        data_arr_table.each_with_index do | row, row_idx |
            puts "#{row}  #{row_idx}"
            # requires refactoring column names to correspond to incoming data
            # row.each_with_index do | datum, data_idx |
            time_s = row[0] + '-' + row[1] + '-' + row[2] + ' ' + row[3] + ':' + row[4]
            record = buoy.meteorological_data.build(
                recorded_data_at: DateTime.parse(time_s),
                wind_dir: row[5].to_i,
                wind_speed:row[6].to_f,
                wind_gust: row[7].to_f,
                wave_height: row[8].to_f,
                dom_wave_period: row[9].to_i,
                avg_wave_period: row[10].to_f,
                wave_dir: row[11].to_i,
                sea_pressure: row[12].to_f,
                air_temp: row[13].to_f,
                sea_temp: row[14].to_f,
                dewpoint_temp: row[15],
                station_visibility: row[16].to_f,
                pressure_tendency: row[17],
                tide: row[18],
            )
            # should include error handling output for controller/cron task
            if record.valid?
                record.save
            end
            # end
        end
    end

    def self.run
        Buoy.all.each do |buoy_obj|
            self.realtime_meteorological_data(buoy_obj[:station_code])
        end
    end
end

## Note for reference when improving the scraper... should update attributes if the below is checked 'y'
# met: indicates whether the station has reported meteorological data in the past eight
# hours (y/n).
# - currents: indicates whether the station has reported water current data in the past
# eight hours (y/n).
# - waterquality: indicates whether the station has reported ocean chemistry data in the
# past eight hours (y/n).
# - dart: indicates whether the station has reported water column height/tsunami data in
# the past 24 hours (y/n).