require "spec_helper"

module Champollion
  RSpec.describe TemplatesController, :type => :routing do
    describe "routing" do

      routes { Champollion::Engine.routes }

      it "routes to #index" do
        expect(:get => "/templates").to route_to("champollion/templates#index")
      end

      it "routes to #new" do
        expect(:get => "/templates/new").to route_to("champollion/templates#new")
      end

      it "routes to #show" do
        expect(:get => "/templates/1").to route_to("champollion/templates#show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/templates/1/edit").to route_to("champollion/templates#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/templates").to route_to("champollion/templates#create")
      end

      it "routes to #update" do
        expect(:put => "/templates/1").to route_to("champollion/templates#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/templates/1").to route_to("champollion/templates#destroy", :id => "1")
      end

    end
  end
end
