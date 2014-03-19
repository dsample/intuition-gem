require 'eventmachine'
require 'em-websocket'
require 'json'

module Intuition
  module Collectors
    class WebSocketRelay
      @@websocket_connections = []

      def collect(event)
        hash = event.to_hash

        puts "Sending to #{@@websocket_connections.count} WebSocket clients"
        begin
          @@websocket_connections.each { |socket| socket.send hash.to_json }
        rescue
          puts "sending failed"
        end
      end

      def self.setup
        puts "Starting WebSocket Relay"
        EM::WebSocket.start(:host => "0.0.0.0", :port => 8080) do |ws|
          ws.onopen do
            puts "Websocket connection opened"
            @@websocket_connections << ws
          end

          ws.onclose do
            puts "Websocket connection closed"
            @@websocket_connections.delete(ws)
          end
        end
      end
    end
  end
end



  