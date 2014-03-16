require 'nokogiri'

module Intuition
  class Heating
    attr_accessor :timestamp, :state, :until, 
      :current_temperature, :required_temperature

    def self.from_xml(data)
      xml = Nokogiri.XML(data)

      heating = Heating.new

      heating.timestamp = Time.at(xml.xpath('/heating/timestamp').text.to_i)

      xml.xpath('/heating/zone').first do |zone|
        heating.current_state = zone.xpath('./temperature/@state').text.to_i
        heating.current_state_until = Time.at(zone.xpath('./temperature/@until').text.to_i)

        heating.current_temperature = zone.xpath('./temperature/current').text.to_f
        heating.required_temperature = zone.xpath('./temperature/required').text.to_f
      end

      return heating
    end
  end
end