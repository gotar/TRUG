require 'rubygems'
require 'bundler'

Bundler.require

Dir["./models/*.rb"].each { |f| require f }
require './app.rb'

require 'rack/rewrite'
use Rack::Rewrite do
  r301 %r{.*}, 'http://trug.pl$&', :if => Proc.new { |rack_env|
    rack_env['SERVER_NAME'] == 'www.trug.pl'
  }
end

run App
