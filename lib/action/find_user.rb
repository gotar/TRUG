require "trug/import"
require "entities/user"

module Action
  class FindUser
    include Trug::Import("persistence.find_user")

    def call(id)
      user_data = find_user.by_id(id).first
      return nil unless user_data

      Entities::User.new(user_data)
    end
  end
end
