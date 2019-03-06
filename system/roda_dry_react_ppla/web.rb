# frozen_string_literal: true

require_relative 'application'
require_relative 'container'

module RodaDryReactPpla
  class Web < Application
    configure do |config|
      config.container = Container
      config.routes = 'routes'
    end

    opts[:root] = Pathname(__FILE__).join('../..').realpath.dirname

    use Rack::Session::Cookie, key: 'roda_dry_react_ppla.session', secret: self['settings'].session_secret

    plugin :error_handler
    plugin :multi_route
    plugin :not_found
    plugin :caching

    include RodaDryReactPpla::Import['db.repos.course_repo', 'db.repos.question_repo']

    route do |r|
      r.root do
        'This application is made to learn dry-rb, roda gems and also react'
      end

      r.multi_route
    end

    not_found do
      response.status = 404
      { error: 'Page not found' }
    end

    error do |e|
      self.class[:rack_monitor].instrument(:error, exception: e)
      raise e if ENV['RACK_ENV'] == 'development'

      if e.is_a?(ROM::TupleCountMismatchError)
        response.status = 404
        response.cache_control private: true, no_cache: true
        { error: 'Record not found' }
      else
        response.cache_control private: true, no_cache: true
        { error: 'Internal Server Error' }
      end
    end

    load_routes!
  end
end
