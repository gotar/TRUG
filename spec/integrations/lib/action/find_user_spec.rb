require "db_helper"
require "action/find_user"
require "action/create_user"

RSpec.describe Action::FindUser do
  let(:action) { Action::FindUser.new }

  context "when user exists" do
    let(:user) { Action::CreateUser.new.(name: "tester", email: "tester@example.com") }

    it "returns user object" do
      result = Action::FindUser.new.(user.id)
      expect(result).to be_a(Entities::User)
      expect(result).to eq(user)
    end
  end

  context "when user doesn't exists" do
    it "returns user object" do
      result = Action::FindUser.new.(123)
      expect(result).to be_nil
    end
  end
end
