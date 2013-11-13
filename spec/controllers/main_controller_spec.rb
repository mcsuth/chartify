require 'spec_helper'

describe MainController do
  it "should have a login page" do
    get :login
    response.should render_template :login
  end
end