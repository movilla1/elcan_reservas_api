require 'rails_helper'

RSpec.describe "Proveedores", type: :request do
  describe "GET /proveedores" do
    it "works! (now write some real specs)" do
      get proveedores_path
      expect(response).to have_http_status(200)
    end
  end
end
