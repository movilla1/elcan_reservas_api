require "rails_helper"

RSpec.describe ProveedoresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/Proveedores").to route_to("Proveedores#index")
    end

    it "routes to #show" do
      expect(:get => "/Proveedores/1").to route_to("Proveedores#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/Proveedores").to route_to("Proveedores#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/Proveedores/1").to route_to("Proveedores#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/Proveedores/1").to route_to("Proveedores#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/Proveedores/1").to route_to("Proveedores#destroy", :id => "1")
    end
  end
end
