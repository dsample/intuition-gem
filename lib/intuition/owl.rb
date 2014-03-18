require 'eventmachine'

module Intuition
  class Owl
    def initialize(server, udp_key)
      @server = server
      @udp_key = udp_key

      #@socket Socket.new(:INET, :DGRAM)
    end

    def self.start_listening(port, collector=nil)
      EventMachine.run do
        Signal.trap("INT") { EventMachine.stop }
        Signal.trap("TERM") { EventMachine.stop }

        Monitor.listen port, collector
      end
    end
  end
end