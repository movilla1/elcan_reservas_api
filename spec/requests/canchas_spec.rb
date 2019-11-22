require 'rails_helper'

RSpec.describe "Canchas", type: :request do
  describe "GET /canchas" do
    it "works! (now write some real specs)" do
      get canchas_path
      expect(response).to have_http_status(200)
    end
  end
end
