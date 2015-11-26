require "rubygems"
require "bundler"

Bundler.require

require_relative "core/boot"

require "rack/rewrite"
use Rack::Rewrite do
  r301 %r{.*}, "http://trug.pl$&", :if => Proc.new { |rack_env|
    rack_env["SERVER_NAME"] == "www.trug.pl"
  }
end

run Trug::Application.freeze.app
