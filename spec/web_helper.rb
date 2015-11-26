require "spec_helper"

require "rack/test"

require_relative "../core/boot"

module AppHelper
  def app
    Trug::Application.app
  end
end

RSpec.configure do |config|
  config.before(:suite) do
    Trug::Application.freeze
  end

  config.include Rack::Test::Methods, type: :request
  config.include AppHelper, type: :request
end
