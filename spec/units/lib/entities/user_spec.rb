require "spec_helper"
require "entities/user"

RSpec.describe Entities::User do
  # let(:entity) { Entities::User.new({ id: 123 }) }

  context "with all required params" do
    let(:params) do
      { id: 123, name: "tester", email: "tester@example.com", role: "member", github_uid: nil, avatar_url: nil,
        created_at: nil, updated_at: nil }
    end

    it "returns entity object" do
      expect(Entities::User.new(params)).to be_a(Entities::User)
    end
  end

  context "with at least one param missing" do
    let(:params) do
      { id: 123, name: "tester", email: "tester@example.com", role: "member", github_uid: nil, avatar_url: nil,
        created_at: nil }
    end

    it "returns entity object" do
      expect{ Entities::User.new(params) }.
        to raise_error(Dry::Data::StructError, "[Entities::User.new] :updated_at is missing in Hash input")
    end
  end

  context "with some extra param" do
    let(:params) do
      { id: 123, name: "tester", email: "tester@example.com", role: "member", github_uid: nil, avatar_url: nil,
        created_at: nil, updated_at: nil, sample: nil }
    end

    it "returns entity object" do
      expect(Entities::User.new(params)).to be_a(Entities::User)
    end
  end
end
