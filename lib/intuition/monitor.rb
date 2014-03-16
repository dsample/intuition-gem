require 'nokogiri'
require 'eventmachine'

module Intuition
  class Monitor < EventMachine::Connection
    def post_init
      puts "Starting to listen for Owl messages"
    end

    def receive_data(data)
      xml = Nokogiri.XML data
      case xml.root.node_name.downcase.to_sym
      when :electricity
        Electricity.from_xml data
      when :heating
        Heating.from_xml data
      else
        puts "Received: #{xml.root.node_name} - #{data}"
        return
      end

      # Emit event to store reading
    end

    def unbind
      puts "Stopping listening for Owl messages"
    end

    def self.listen(port)
      EventMachine::open_datagram_socket('0.0.0.0', port, Monitor)
    end
  end
end