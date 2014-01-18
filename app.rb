require 'sinatra/base'

class App < Sinatra::Base
  set :haml, format: :html5

  get '/' do
    haml :home, layout: :base
  end

  get '/archive' do
    haml :archive, layout: :base
  end
end
