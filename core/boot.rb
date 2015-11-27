require "logger"
require "rodakase/view"

require_relative "trug/container"

Trug::Container.finalize! do |container|
  container.register(:logger, Logger.new(container.root.join("log/application.log")))
end

require_relative "../config/initializers/omniauth"
require "trug/application"
require "trug/view"
