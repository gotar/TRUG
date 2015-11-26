require "trug/import"
require "entities/user"

module Action
  class SearchUsers
    include Trug::Import("persistence.find_user")

    def call(params)
      find_user.by_params(params).to_a.map{ |user_data| Entities::User.new(user_data) }
    end
  end
end
