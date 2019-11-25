require "rails_helper"

RSpec.describe ArticulosCompraController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/articulos_compra").to route_to("articulos_compra#index")
    end

    it "routes to #show" do
      expect(:get => "/articulos_compra/1").to route_to("articulos_compra#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/articulos_compra").to route_to("articulos_compra#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/articulos_compra/1").to route_to("articulos_compra#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/articulos_compra/1").to route_to("articulos_compra#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/articulos_compra/1").to route_to("articulos_compra#destroy", :id => "1")
    end
  end
end
