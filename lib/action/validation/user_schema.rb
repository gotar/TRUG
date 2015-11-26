require "dry-validation"

module Action
  module Validation
    class UserSchema < Dry::Validation::Schema
      key(:name) { |value| value.filled? }
      key(:email) { |value| value.filled? && value.format?(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i) }
    end
  end
end
