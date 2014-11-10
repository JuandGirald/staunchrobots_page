require 'rails_helper'

RSpec.describe "Cvs", :type => :request do
  describe "GET /cvs" do
    it "works! (now write some real specs)" do
      get cvs_path
      expect(response.status).to be(200)
    end
  end
end
