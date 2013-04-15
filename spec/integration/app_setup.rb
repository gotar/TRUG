require 'rack/test'
require_relative '../../app'

Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

module AppSetup
  def self.included(base)
    base.instance_eval do
      include Rack::Test::Methods
    end
  end

  def app
    App
  end
end
