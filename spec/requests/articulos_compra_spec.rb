require 'rails_helper'

RSpec.describe "ArticulosCompra", type: :request do
  describe "GET /articulos_compra" do
    it "works! (now write some real specs)" do
      get articulos_compra_path
      expect(response).to have_http_status(200)
    end
  end
end
