module Trug
  class Application < Rodakase::Application
    plugin :heartbeat
    plugin :halt, :symbol_matchers
    plugin :assets, css: resolve(:page).assets.stylesheets
  end
end
