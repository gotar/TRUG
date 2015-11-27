require "trug/import"
require "entities/user"
require "transproc"

module Action
  class UpdateUser
    include Trug::Import(
      "action.validation.user_schema",
      "persistence.update_user",
      "persistence.find_user",
    )

    extend Transproc::Registry

    import Transproc::HashTransformations

    attr_reader :errors

    def call(id, params)
      user = find_user.by_id(id).first
      return nil unless user

      new_params = user.to_hash.merge(prepare_attributes(params))
      errors = user_schema.messages(new_params)

      if errors.any?
        @errors = errors.to_h
        nil
      else
        Entities::User.new(update_user.by_id(user[:id]).(new_params))
      end
    end

    def prepare_attributes(params)
      transformer[params].merge(updated_at: Time.now)
    end

    def transformer
      self.class[:accept_keys, [:name, :email, :github_uid, :avatar_url]]
    end
  end
end
