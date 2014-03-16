require 'nokogiri'

module Intuition
  class Electricity
    attr_accessor :timestamp, :channels, :current_unit, :current_value

    def self.from_xml(data)
      xml = Nokogiri.XML(data)

      elec = Electricity.new

      elec.timestamp = Time.now
      elec.channels = Array.new
      elec.current_unit = 'w'
      elec.current_value = 0

      xml.xpath('/electricity/chan').each do |channel|
        chan = Hash.new
        chan[:id] = channel.xpath('./@id').text.to_i

        chan[:current_unit] = channel.xpath('./curr/@units').text
        chan[:current_value] = channel.xpath('./curr').text.to_f

        chan[:day_units] = channel.xpath('./day/@units').text
        chan[:day_value] = channel.xpath('./day/').text.to_f

        elec.channels.push chan
        elec.current_value += chan[:current_value]
      end
    end
  end
end