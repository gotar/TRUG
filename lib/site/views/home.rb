require "site/view/controller"
require "site/import"
require "site/view/parts/meetup"

module Site
  module Views
    class Home < View::Controller
      include Import["repos.event_repo"]

      configure do |config|
        config.template = "home"
      end

      expose :meetup, as: View::Parts::Meetup do
        event_repo.lastest
      end
    end
  end
end
