module Trug
  class Application < Rodakase::Application
    plugin :heartbeat
    plugin :halt, :symbol_matchers
    plugin :assets, css: resolve(:page).assets.stylesheets, path: "assets"
    plugin :assets, js: resolve(:page).assets.javascripts, path: "assets"
    plugin :static, ['/images'], root: "assets"
  end
end
