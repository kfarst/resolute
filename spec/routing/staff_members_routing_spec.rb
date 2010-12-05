require "spec_helper"

describe StaffMembersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/staff_members" }.should route_to(:controller => "staff_members", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/staff_members/new" }.should route_to(:controller => "staff_members", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/staff_members/1" }.should route_to(:controller => "staff_members", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/staff_members/1/edit" }.should route_to(:controller => "staff_members", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/staff_members" }.should route_to(:controller => "staff_members", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/staff_members/1" }.should route_to(:controller => "staff_members", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/staff_members/1" }.should route_to(:controller => "staff_members", :action => "destroy", :id => "1")
    end

  end
end
