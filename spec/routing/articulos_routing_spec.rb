require "rails_helper"

RSpec.describe ArticulosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/articulos").to route_to("articulos#index")
    end

    it "routes to #show" do
      expect(:get => "/articulos/1").to route_to("articulos#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/articulos").to route_to("articulos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/articulos/1").to route_to("articulos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/articulos/1").to route_to("articulos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/articulos/1").to route_to("articulos#destroy", :id => "1")
    end
  end
end
