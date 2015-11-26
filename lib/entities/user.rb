require "equalizer"
require "dry/data"

module Entities
  class User < Dry::Data::Struct
    include Equalizer.new(:id, :name, :email, :role, :github_uid, :avatar_url, :created_at, :updated_at)

    attribute :id, "int"
    attribute :name, "string"
    attribute :email, "string"
    attribute :role, "string"
    attribute :github_uid, "string"
    attribute :avatar_url, "string"
    attribute :created_at, "date_time"
    attribute :updated_at, "date_time"

    def to_hash
      {
        id: id,
        name: name,
        email: email,
        role: role,
        github_uid: github_uid,
        avatar_url: avatar_url,
        created_at: created_at,
        updated_at: updated_at
      }
    end
  end
end
