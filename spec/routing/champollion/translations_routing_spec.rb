require "spec_helper"

module Champollion
  RSpec.describe TranslationsController, :type => :routing do
    describe "routing" do

      routes { Champollion::Engine.routes }

      it "routes to #index" do
        expect(:get => "/translations").to route_to("champollion/translations#index")
      end

      it "routes to #new" do
        expect(:get => "/translations/new").to route_to("champollion/translations#new")
      end

      it "routes to #show" do
        expect(:get => "/translations/1").to route_to("champollion/translations#show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/translations/1/edit").to route_to("champollion/translations#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/translations").to route_to("champollion/translations#create")
      end

      it "routes to #update" do
        expect(:put => "/translations/1").to route_to("champollion/translations#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/translations/1").to route_to("champollion/translations#destroy", :id => "1")
      end

    end
  end
end
