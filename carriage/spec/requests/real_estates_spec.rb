require 'rails_helper'

RSpec.describe "RealEstates", type: :request do
  describe "GET /real_estates" do
    it "works! (now write some real specs)" do
      get real_estates_path
      expect(response).to have_http_status(200)
    end
  end
end
