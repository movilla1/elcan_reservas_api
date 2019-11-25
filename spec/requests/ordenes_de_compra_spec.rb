require 'rails_helper'

RSpec.describe "OrdenesDeCompra", type: :request do
  describe "GET /ordenes_de_compra" do
    it "works! (now write some real specs)" do
      get ordenes_de_compra_path
      expect(response).to have_http_status(200)
    end
  end
end
