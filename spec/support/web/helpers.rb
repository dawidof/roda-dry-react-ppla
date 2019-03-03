# frozen_string_literal: true

module Test
  module WebHelpers
    include Rack::Test::Methods

    module_function

    def app
      RodaDryReactPpla::Web.app
    end

    def json
      @json ||= JSON.parse(response.body)
    end

    def response
      last_response
    end

    def data_hash
      json['data']
    end

    def errors_arr
      json['errors']
    end

    def error
      json['error']
    end
  end
end
