require_relative 'app_setup'

describe "application" do
  include AppSetup

  context "homepage" do
    it "should render 200 OK for the home page" do
      get '/'
      last_response.should be_ok
    end

    it "should contain 'Dane' section" do
      get '/'
      last_response.body.should match /dane/i
    end

    it "should contain 'Lokalizacja' section" do
      get '/'
      last_response.body.should match /lokalizacja/i
    end

    it "should contain 'Newsletter' section" do
      get '/'
      last_response.body.should match /newsletter/i
    end

    it "should contain Mailchimp form inside 'Newsletter' section" do
      get '/'
      last_response.should match /form(.*)id='mc-embedded-subscribe-form'/
      last_response.should match /input(.*)id='mce-EMAIL'/
    end
  end

  context 'archive' do
    it 'should render 200 OK for the archive page' do
      get '/archive'
      last_response.should be_ok
    end

    it "shold contain 'Archiwum' title" do
      get '/archive'
      last_response.body.should match(/Archiwum/)
    end
  end
end
