require "trug/import"
require "entities/user"
require "transproc"

module Action
  class CreateOauthUser
    include Trug::Import(
              "action.search_users",
              "action.create_user",
              "action.update_user"
            )

    attr_reader :errors

    def call(data)
      params = prepare_attributes(data)

      user = search_users.(email: params[:email]).first
      if user
        update_user.(user.id, params)
      else
        create_user.(params)
      end
    end

    def prepare_attributes(data)
      {
        name: data.info.name,
        email: data.info.email,
        github_uid: data.uid,
        avatar_url: data.info.image
      }
    end
  end
end
