require "trug/import"
require "trug/view"

module Ui
  class Root < Trug::View
    configure do |config|
      config.template = "root"
    end
  end
end
