require 'spec_helper'

describe StaffMembersController do

  def mock_staff_member(stubs={})
    @mock_staff_member ||= mock_model(StaffMember, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all staff_members as @staff_members" do
      StaffMember.stub(:all) { [mock_staff_member] }
      get :index
      assigns(:staff_members).should eq([mock_staff_member])
    end
  end

  describe "GET show" do
    it "assigns the requested staff_member as @staff_member" do
      StaffMember.stub(:find).with("37") { mock_staff_member }
      get :show, :id => "37"
      assigns(:staff_member).should be(mock_staff_member)
    end
  end

  describe "GET new" do
    it "assigns a new staff_member as @staff_member" do
      StaffMember.stub(:new) { mock_staff_member }
      get :new
      assigns(:staff_member).should be(mock_staff_member)
    end
  end

  describe "GET edit" do
    it "assigns the requested staff_member as @staff_member" do
      StaffMember.stub(:find).with("37") { mock_staff_member }
      get :edit, :id => "37"
      assigns(:staff_member).should be(mock_staff_member)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created staff_member as @staff_member" do
        StaffMember.stub(:new).with({'these' => 'params'}) { mock_staff_member(:save => true) }
        post :create, :staff_member => {'these' => 'params'}
        assigns(:staff_member).should be(mock_staff_member)
      end

      it "redirects to the created staff_member" do
        StaffMember.stub(:new) { mock_staff_member(:save => true) }
        post :create, :staff_member => {}
        response.should redirect_to(staff_member_url(mock_staff_member))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved staff_member as @staff_member" do
        StaffMember.stub(:new).with({'these' => 'params'}) { mock_staff_member(:save => false) }
        post :create, :staff_member => {'these' => 'params'}
        assigns(:staff_member).should be(mock_staff_member)
      end

      it "re-renders the 'new' template" do
        StaffMember.stub(:new) { mock_staff_member(:save => false) }
        post :create, :staff_member => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested staff_member" do
        StaffMember.should_receive(:find).with("37") { mock_staff_member }
        mock_staff_member.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :staff_member => {'these' => 'params'}
      end

      it "assigns the requested staff_member as @staff_member" do
        StaffMember.stub(:find) { mock_staff_member(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:staff_member).should be(mock_staff_member)
      end

      it "redirects to the staff_member" do
        StaffMember.stub(:find) { mock_staff_member(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(staff_member_url(mock_staff_member))
      end
    end

    describe "with invalid params" do
      it "assigns the staff_member as @staff_member" do
        StaffMember.stub(:find) { mock_staff_member(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:staff_member).should be(mock_staff_member)
      end

      it "re-renders the 'edit' template" do
        StaffMember.stub(:find) { mock_staff_member(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested staff_member" do
      StaffMember.should_receive(:find).with("37") { mock_staff_member }
      mock_staff_member.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the staff_members list" do
      StaffMember.stub(:find) { mock_staff_member }
      delete :destroy, :id => "1"
      response.should redirect_to(staff_members_url)
    end
  end

end
