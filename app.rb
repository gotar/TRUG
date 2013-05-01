require 'sinatra/base'
require 'active_support/all'

class App < Sinatra::Base

  set :haml, :format => :html5

  before do
    @rugs = Rug.all
  end

  get '/' do
    haml :home, layout: :base
  end
end
