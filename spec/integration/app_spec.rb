require_relative 'app_setup'

describe "application" do
  include AppSetup

  context "homepage" do
    it "should render 200 OK for the home page" do
      get '/'
      last_response.should be_ok
    end

    it "should contain Hello!" do
      get '/'
      last_response.body.should match /hello!/i
    end
  end
end
