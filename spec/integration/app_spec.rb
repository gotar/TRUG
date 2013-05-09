require_relative 'app_setup'

describe "application" do
  include AppSetup

  context "homepage" do
    it "should render 200 OK for the home page" do
      get '/'
      last_response.should be_ok
    end

    it "should contain ,,Dane'' section" do
      get '/'
      last_response.body.should match /dane/i
    end

    it "should contain ,,Lokalizacja'' section" do
      get '/'
      last_response.body.should match /lokalizacja/i
    end
  end
end
