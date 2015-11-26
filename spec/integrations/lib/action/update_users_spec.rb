require "db_helper"
require "action/create_user"
require "action/update_user"

RSpec.describe Action::UpdateUser do
  let(:action) { Action::UpdateUser.new }

  context "when user doesn't exists" do
    it "returns nil" do
      expect(action.(123, {})).to be_nil
    end
  end

  context "when user exists" do
    let(:user) { Action::CreateUser.new.(name: "tester", email: "tester@example.com") }

    context "with valid params" do
      it "returns nil" do
        result = action.(user.id, name: nil)
        expect(result).to be_nil
      end

      describe ".errors" do
        before { action.(user.id, name: nil) }

        it "return hash with errors" do
          expect(action.errors).to eq({ name: ["name must be filled"] })
        end
      end
    end
  end
end
