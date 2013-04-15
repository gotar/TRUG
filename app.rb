require 'sinatra/base'
require 'active_support/all'

class App < Sinatra::Base
  get '/' do
   'OK'
  end
end
