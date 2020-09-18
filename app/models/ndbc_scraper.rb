require 'nokogiri'
require 'open-uri'

module NdbcScraper
    def self.get_station_links
        station_list_url ='https://www.ndbc.noaa.gov/to_station.shtml'
        html = URI.open(station_list_url)
        doc = Nokogiri::HTML(html)

        station_pages = doc.css('pre a').map { |link| link['href'] }
        puts station_pages
    end
end