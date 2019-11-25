require "rails_helper"

RSpec.describe OrdenesDeCompraController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/ordenes_de_compra").to route_to("ordenes_de_compra#index")
    end

    it "routes to #show" do
      expect(:get => "/ordenes_de_compra/1").to route_to("ordenes_de_compra#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/ordenes_de_compra").to route_to("ordenes_de_compra#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ordenes_de_compra/1").to route_to("ordenes_de_compra#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ordenes_de_compra/1").to route_to("ordenes_de_compra#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ordenes_de_compra/1").to route_to("ordenes_de_compra#destroy", :id => "1")
    end
  end
end
