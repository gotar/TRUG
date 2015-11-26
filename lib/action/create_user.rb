require "trug/import"
require "entities/user"
require "transproc"

module Action
  class CreateUser
    include Trug::Import(
              "action.validation.user_schema",
              "persistence.persist_user"
            )

    extend Transproc::Registry

    import Transproc::HashTransformations

    attr_reader :errors

    def call(params)
      errors = user_schema.messages(params)

      if errors.any?
        @errors = errors.to_h
        nil
      else
        Entities::User.new(persist_user.(prepare_attributes(params)))
      end
    end

    def prepare_attributes(params)
      transformer[params].merge(created_at: Time.now)
    end

    def transformer
      self.class[:accept_keys, [:name, :email, :github_uid, :avatar_url]]
    end
  end
end
