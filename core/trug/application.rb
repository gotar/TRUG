require "rodakase/application"

module Trug
  class Application < Rodakase::Application
    unless ENV.fetch("RACK_ENV", "development") == "production"
      Dotenv.load
    end

    use Rack::Session::Cookie, secret: ENV.fetch("SECRET")
    use ::OmniAuth::Builder do
      provider :github, ENV.fetch("API_GITHUB_KEY"), ENV.fetch("API_GITHUB_SECRET")
    end

    configure do |config|
      config.routes = "web/routes".freeze
      config.container = Container
    end

    require_relative "../../lib/action/find_user"
    def current_user
      ::Action::FindUser.new.(session[:user_id])
    end

    route do |r|
      r.on("auth") do
        r.on("github") do
          r.is("callback") do
            r.get do
              require_relative "../../lib/action/create_oauth_user"
              user = ::Action::CreateOauthUser.new.(r.env['omniauth.auth'])
              session[:user_id] = user.id

              r.redirect("/")
            end
          end
        end

        r.is("failure") do
          r.get do
            r.redirect("/")
          end
        end
      end

      r.is("sign_out") do
        r.get do
          session[:user_id] = nil

          r.redirect("/")
        end
      end

      r.assets
      r.multi_route

      r.root do
        r.is(to: 'ui.root', call_with: [session: session])
      end
    end

    load_routes!
  end
end
