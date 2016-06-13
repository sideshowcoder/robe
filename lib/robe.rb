require 'robe/sash'
require 'robe/server'

module Robe
  class << self
    attr_accessor :server

    def start(host = "0.0.0.0", port = 0)
      return running_string if @server

      @server = Server.new(Sash.new, host, port)

      ['INT', 'TERM'].each do |signal|
        trap(signal) { stop }
      end
      Thread.new do
        unless Thread.current[:__yard_registry__]
          Thread.current[:__yard_registry__] = Thread.main[:__yard_registry__]
        end
        @server.start
      end

      # TODO is something actually running here? I'm confused!
      @server.wait_for_it

      running_string
    end

    def stop
      @server.shutdown
      @server = nil
    end

    private

    def running_string
      "robe on #{@server.port}"
    end
  end
end
