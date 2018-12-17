require "site/repo"

module Site
  module Repos
    class EventRepo < Site::Repo[:events]
      def all
        events.to_a
      end

      def lastest
        events.first
      end
    end
  end
end
