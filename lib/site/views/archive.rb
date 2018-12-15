require "site/view/controller"
require "site/import"
require "site/view/parts/meetup"

module Site
  module Views
    class Archive < View::Controller
      include Import["repos.event_repo"]

      configure do |config|
        config.template = "archive"
      end

      expose :meetups, as: View::Parts::Meetup do
        event_repo.all
      end
    end
  end
end
