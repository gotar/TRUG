require_relative 'app_setup'

describe "application" do
  include AppSetup

  it "should render 200 OK for the home page" do
    get '/'
    last_response.should be_ok
  end
end
