require_relative "container"

module Trug
  Import = Trug::Container.import_module

  def self.Import(*args)
    Import[*args]
  end
end
