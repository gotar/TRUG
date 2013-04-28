require 'sinatra/base'
require 'active_support/all'

class App < Sinatra::Base

  set :haml, :format => :html5

  get '/' do
    haml :home, layout: :base
  end
end
