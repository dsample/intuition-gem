require 'nokogiri'
require 'eventmachine'

module Intuition
  class Monitor < EventMachine::Connection
    @@collectors = nil

    def post_init
      puts "Starting to listen for Owl messages"
    end

    def receive_data(data)
      xml = Nokogiri.XML data
      case xml.root.node_name.downcase.to_sym
      when :electricity
        reading = Electricity.from_xml data
      when :heating
        reading = Heating.from_xml data
      else
        puts "Received: #{xml.root.node_name} - #{data}"
        return
      end

      if @@collectors
        @@collectors.each do |collector|
          collector.collect reading
        end
      end
      puts reading.inspect unless @@collectors
    end

    def unbind
      puts "Stopping listening for Owl messages"
    end

    def self.listen(port, collectors=nil)
      if collectors
        @@collectors = Array.new.push collectors unless collectors.kind_of? Array
        @@collectors = collectors if collectors.kind_of? Array

        @@collectors.each do |collector|
          collector.class.setup if defined? collector.class.setup
        end
      end
      EventMachine::open_datagram_socket('0.0.0.0', port, Monitor)
    end
  end
end