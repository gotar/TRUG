require "db_helper"
require "action/create_user"

RSpec.describe Action::CreateUser do
  let(:action) { Action::CreateUser.new }

  context "with valid params" do
    it "returns user object" do
      expect(action.(name: "tester", email: "tester@example.com")).to be_a(Entities::User)
    end
  end

  context "with invalid params" do
    it "returns nil" do
      expect(action.(name: "tester")).to be_nil
    end

    describe ".errors" do
      before { action.(name: "tester") }

      it "return hash with errors" do
        expect(action.errors).to eq({ email: ["email is missing"] })
      end
    end
  end

  context "when email exists" do
    before do
      action.(name: "tester", email: "tester@example.com")
    end

    it "raise ROM::SQL::UniqueConstraintError" do
      expect {
        action.(name: "tester", email: "tester@example.com")
      }.to raise_error(ROM::SQL::UniqueConstraintError)
    end
  end
end
