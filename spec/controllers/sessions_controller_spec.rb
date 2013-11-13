require 'spec_helper'

describe SessionsController, "OmniAuth" do

    before do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end

    describe "create" do
      it "should set a session variable to the OmniAuth auth hash" do
        request.env["omniauth.auth"][:uid].should == '123545'
      end
    end

end
