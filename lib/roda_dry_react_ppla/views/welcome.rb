require "roda_dry_react_ppla/view/controller"

module RodaDryReactPpla
  module Views
    class Welcome < RodaDryReactPpla::View::Controller
      configure do |config|
        config.template = "welcome"
      end
    end
  end
end
