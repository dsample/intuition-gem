require 'eventmachine'
require 'em-mongo'

module Intuition
  module Collectors
    class MongoDB
      def initialize(server='127.0.0.1', database='Home')
        @collections = Hash.new
        @server = server
        @database = database
      end

      def collect(event)
        @db = EM::Mongo::Connection.new(@server).db(@database) unless @db
        collection_name = event.class.name.split('::').last
        @collections[event.class.to_s] = @db.collection(collection_name) unless @collections[collection_name]

        collection = @collections[event.class.to_s]

        bson = event.to_hash

        puts "#{bson[:time]} #{collection_name}"
        collection.insert bson
      end
    end
  end
end