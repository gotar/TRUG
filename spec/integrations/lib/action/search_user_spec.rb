require "db_helper"
require "action/create_user"
require "action/search_users"

RSpec.describe Action::SearchUsers do
  let(:action) { Action::SearchUsers.new }

  context "when user exists" do
    let(:user) { Action::CreateUser.new.(name: "tester", email: "tester@example.com") }

    it "returns user objects" do
      result = action.(email: user.email)
      expect(result).to be_a(Array)
      expect(result).not_to be_empty
      expect(result.first).to be_a(Entities::User)
      expect(result.first).to eq(user)
    end
  end

  context "when user doesn't exists" do
    it "returns empty collection" do
      result = action.(email: "tester@example.com")
      expect(result).to be_a(Array)
      expect(result).to be_empty
    end
  end
end
