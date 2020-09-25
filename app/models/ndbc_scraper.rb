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
           Buoy.create!(station_code: station[:id], station_name: station[:name], station_owner: station[:owner], latitude: station[:lat], longitude: station[:lon], type: station[:type], state: stationelev: station[:elev], met: station[:met], dart: station[:dart], currents: station[:currents], waterquality: station[:waterquality] )
        end
    end

    # Web crawler to extract buoy specific information
    def self.get_station_links
        station_list_url ='https://www.ndbc.noaa.gov/to_station.shtml'
        html = URI.open(station_list_url)
        doc = Nokogiri::HTML(html)

        station_pages = doc.css('pre a').map { |link| link['href'] }
        puts station_pages
    end
end