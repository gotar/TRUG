require "rodakase/application"

module Trug
  class Application < Rodakase::Application
    configure do |config|
      config.routes = "web/routes".freeze
      config.container = Container
    end

    route do |r|
      r.assets
      r.multi_route

      r.root do
        r.is(to: 'ui.root')
      end
    end

    load_routes!
  end
end
