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


# <electricity id='443719003367'>
#   <signal rssi='-61' lqi='3'/>
#   <battery level='100%'/>
#   <chan id='0'>
#     <curr units='w'>466.00</curr>
#     <day units='wh'>1671.15</day>
#   </chan>
#   <chan id='1'>
#     <curr units='w'>0.00</curr>
#     <day units='wh'>0.00</day>
#   </chan>
#   <chan id='2'>
#     <curr units='w'>0.00</curr>
#     <day units='wh'>0.00</day>
#   </chan>
# </electricity>