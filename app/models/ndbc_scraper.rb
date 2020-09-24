require 'nokogiri'
require 'net/http'
require 'open-uri'

module NdbcScraper

    def self.get_station_xml
        ndbc_station_xml = URI.parse("https://www.ndbc.noaa.gov/metadata/stationmetadata.xml")

        ndbc_data = Net::HTTP.get(ndbc_station_xml)
        xml = Nokogiri.XML(ndbc_data)

        stations = xml.xpath("//station")

        stations.each do |station|
           Buoy.create!(station_code: station[:id], station_name: station[:name], station_owner: station[:owner], latitude: station.children[1]["lat"], longitude: station.children[1]["lng"], elev: station.children[1]["elev"], met: station.children[1]["met"], hull: station.children[1]["hull"], anemom_height: station.children[1]["anemom_height"] )
        end

            # stations[0][:id]
            # stations[0][:name]
            # stations[0][:owner]
            # stations[0][:pgm]
            # stations[0][:type]
            # ----- 
            # stations[0].children[1]["lat"]
            # stations[0].children[1]["lng"]
            # stations[0].children[1]["elev"]
            # stations[0].children[1]["met"]
            # stations[0].children[1]["hull"]
            # stations[0].children[1]["anemom_height"]
    end

    # NDBC XML file appears to be missing 400+ buoys; designing web crawler to save the missing buoys to db
    def self.get_station_links
        station_list_url ='https://www.ndbc.noaa.gov/to_station.shtml'
        html = URI.open(station_list_url)
        doc = Nokogiri::HTML(html)

        station_pages = doc.css('pre a').map { |link| link['href'] }
        puts station_pages
    end
end