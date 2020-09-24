require 'nokogiri'
require 'net/http'
require 'open-uri'

module NdbcScraper

    def self.get_station_xml
        ndbc_station_xml = URI.parse("https://www.ndbc.noaa.gov/metadata/stationmetadata.xml")
        ndbc_data = Net::HTTP.get(ndbc_station_xml)
        xml = Nokogiri.XML(ndbc_data)
        stations = xml.xpath("//station")
        puts stations[0]
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

    def self.get_station_links
        station_list_url ='https://www.ndbc.noaa.gov/to_station.shtml'
        html = URI.open(station_list_url)
        doc = Nokogiri::HTML(html)

        station_pages = doc.css('pre a').map { |link| link['href'] }
        puts station_pages
    end
end