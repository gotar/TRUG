require 'sinatra/base'
require 'sinatra/assetpack'
require 'less'

class App < Sinatra::Base
  register Sinatra::AssetPack

  assets do
    serve '/css', from: 'public/css'

    css :styles, '/css/styles.css', [
      '/css/custom.css',
      '/css/custom-mailchimp.css'
    ]
    css_compression :less

    prebuild true
    expires 86400 * 365, :public
  end

  set :haml, format: :html5

  get '/' do
    haml :home, layout: :base
  end

  get '/archive' do
    haml :archive, layout: :base
  end
end
