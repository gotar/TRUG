require 'sinatra/base'
require 'sinatra/assetpack'
require 'less'
require 'yaml'

class App < Sinatra::Base
  register Sinatra::AssetPack

  helpers do
    def meetup_header(meetup)
      header = []
      header.push("TRUG##{meetup[:number]}") if  meetup[:number]
      header.push("(#{meetup[:date]})") if meetup[:date]
      header.join(' ')
    end
  end

  assets do
    serve '/css', from: 'public/css'
    serve '/js', from: 'public/js'

    css :styles, '/css/styles.css', ['/css/custom.css']
    css_compression :less

    js :load_google_map, '/js/application.js', ['/js/map.js']
    js :load_archive, '/js/archive.js', ['/js/jquery-2.1.0.min.js', '/js/archive.js']

    prebuild true
    expires 86400 * 365, :public
  end

  set :haml, format: :html5

  get '/' do
    haml :home, layout: :base
  end

  get '/archive' do
    meetups_path = File.expand_path('../meetups.yaml', __FILE__)
    @meetups = File.exists?(meetups_path) ? YAML.load_file(meetups_path) : nil
    haml :archive, layout: :base
  end
end
