require 'sinatra/base'
require 'sass'
require 'slim'
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

    def talk_title(talk)
      if talk[:slides]
        "<a href='#{talk[:slides]}' target='_blank'>#{talk[:title]}</a>"
      else
        talk[:title]
      end
    end

    def talk_speaker(talk)
      if talk[:home_page]
        "<a href='#{talk[:home_page]}' target='_blank'>#{talk[:fullname]}</a>"
      else
        talk[:fullname]
      end
    end

    def talk_source_code(talk)
      "Source code: <a href='#{talk[:source_code]}' target='_blank'>#{talk[:source_code]}</a>" if talk[:source_code]
    end
  end

  assets do
    serve '/images', from: 'public/img'
    serve '/stylesheets', from: 'public/stylesheets'
    serve '/js', from: 'public/js'

    css_compression :sass

    js :load_google_map, '/js/application.js', ['/js/map.js']
    js :load_archive, '/js/archive.js', ['/js/jquery-2.1.0.min.js', '/js/archive.js']

    prebuild true
    expires 86400 * 365, :public
  end

  set :slim, format: :html5

  get '/' do
    slim :index, layout: :layout
  end

  get '/archive' do
    meetups_path = File.expand_path('../meetups.yaml', __FILE__)
    @meetups = File.exists?(meetups_path) ? YAML.load_file(meetups_path) : nil
    slim :archive, layout: :layout
  end
end
