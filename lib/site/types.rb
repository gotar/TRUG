# auto_register: false

require "dry/types"

module Site
  module Types
    include Dry.Types(default: :nominal)
  end
end

