require 'spec_helper'

describe PagesController do

  describe "GET 'user'" do
    it "should be successful" do
      get 'user'
      response.should be_success
    end
  end

end
