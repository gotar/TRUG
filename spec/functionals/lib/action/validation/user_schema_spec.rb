require "spec_helper"
require "action/validation/user_schema"

RSpec.describe Action::Validation::UserSchema do
  let(:schema) { Action::Validation::UserSchema.new }

  context "with empty hash" do
    let(:params) { {} }

    it "returns errors" do
      expect(schema.messages(params)).to eq([[:name, ["name is missing"]], [:email, ["email is missing"]]])
    end
  end

  context "with invalid email" do
    let(:params) { { name: "test", email: "test_example.com" } }

    it "returns errors" do
      expect(schema.messages(params)).to eq([[:email, ["email is in invalid format"]]])
    end
  end

  context "when params are valid" do
    let(:params) { { name: "test", email: "test@example.com" } }

    it "returns errors" do
      expect(schema.messages(params)).to eq([])
    end
  end
end
