require_relative "container"

require "rodakase/view"
require "trug/page"

module Trug
  Container.register(:page, Page.new(Container.config))

  class View < Rodakase::View::Layout
    setting :root, Container.root.join("web/templates")
    setting :scope, Container[:page]
    setting :engine, :slim
    setting :name, "application"
  end
end
