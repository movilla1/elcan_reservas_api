require "rails_helper"

RSpec.describe VentaController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/venta").to route_to("venta#index")
    end

    it "routes to #show" do
      expect(:get => "/venta/1").to route_to("venta#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/venta").to route_to("venta#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/venta/1").to route_to("venta#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/venta/1").to route_to("venta#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/venta/1").to route_to("venta#destroy", :id => "1")
    end
  end
end
