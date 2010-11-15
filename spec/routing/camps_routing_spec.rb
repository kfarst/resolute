require "spec_helper"

describe CampsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/camps" }.should route_to(:controller => "camps", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/camps/new" }.should route_to(:controller => "camps", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/camps/1" }.should route_to(:controller => "camps", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/camps/1/edit" }.should route_to(:controller => "camps", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/camps" }.should route_to(:controller => "camps", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/camps/1" }.should route_to(:controller => "camps", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/camps/1" }.should route_to(:controller => "camps", :action => "destroy", :id => "1")
    end

  end
end
