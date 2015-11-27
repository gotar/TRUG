require "trug/import"
require "trug/view"

module Ui
  class Root < Trug::View
    include Trug::Import(
              "action.find_user"
            )

    configure do |config|
      config.template = "root"
    end

    def locals(params)
      {
        current_user: find_user.(params.fetch(:session)[:user_id])
      }
    end
  end
end
