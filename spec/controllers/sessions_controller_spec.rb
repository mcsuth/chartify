require 'spec_helper'

describe SessionsController do

    describe "OmniAuth hash" do

      before do
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
      end

      it "should set a provider to the OmniAuth auth hash" do
        request.env["omniauth.auth"][:provider].should == 'facebook'
      end

      it "should set a session variable to the OmniAuth auth hash" do
        request.env["omniauth.auth"][:uid].should == '123545'
      end

      it "should set the name of user to the OmniAuth auth hash" do
        request.env["omniauth.auth"][:info][:name].should == 'Jhonny Appleseed'
      end

      it "should set the email of user to the OmniAuth auth hash" do
        request.env["omniauth.auth"][:info][:email].should == 'jhonnysapples@gmail.com'
      end

      it "should set a token to the OmniAuth auth hash" do
        request.env["omniauth.auth"][:credentials][:token].should == 'testtoken1234'
      end

    end

end
