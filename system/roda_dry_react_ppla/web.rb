require_relative "application"
require_relative "container"

module RodaDryReactPpla
  class Web < Application
    configure do |config|
      config.container = Container
      config.routes = "routes".freeze
    end

    opts[:root] = Pathname(__FILE__).join("../..").realpath.dirname

    use Rack::Session::Cookie, key: "roda_dry_react_ppla.session", secret: self["settings"].session_secret

    plugin :error_handler
    plugin :multi_route

    route do |r|
      r.multi_route

      r.root do
        'Hello World'
      end
    end

    error do |e|
      self.class[:rack_monitor].instrument(:error, exception: e)
      raise e
    end

    load_routes!
  end
end
