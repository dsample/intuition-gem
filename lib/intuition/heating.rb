require 'nokogiri'

module Intuition
  class Heating
    attr_accessor :timestamp, :state, :state_until, 
      :current_temperature, :required_temperature

    def self.from_xml(data)
      xml = Nokogiri.XML(data)

      heating = Heating.new

      heating.timestamp = Time.at(xml.xpath('/heating/timestamp').text.to_i)

      xml.xpath('/heating/zones/zone').each do |zone|
        heating.state = zone.xpath('./temperature/@state').text.to_i
        heating.state_until = Time.at(zone.xpath('./temperature/@until').text.to_i)

        heating.current_temperature = zone.xpath('./temperature/current').text.to_f
        heating.required_temperature = zone.xpath('./temperature/required').text.to_f
      end

      return heating
    end

    def to_hash
      hash = Hash.new
      hash[:type] = 'Heating'
      hash[:time] = @timestamp.utc
      hash[:data] = {
        :current_temperature => @current_temperature, 
        :required_temperature => @required_temperature, 
        :state => @state,
        :state_until => @state_until
      }

      return hash
    end
  end
end
