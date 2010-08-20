require 'test_helper'

class CampRegistrationsControllerTest < ActionController::TestCase
  setup do
    @camp_registration = camp_registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:camp_registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camp_registration" do
    assert_difference('CampRegistration.count') do
      post :create, :camp_registration => @camp_registration.attributes
    end

    assert_redirected_to camp_registration_path(assigns(:camp_registration))
  end

  test "should show camp_registration" do
    get :show, :id => @camp_registration.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @camp_registration.to_param
    assert_response :success
  end

  test "should update camp_registration" do
    put :update, :id => @camp_registration.to_param, :camp_registration => @camp_registration.attributes
    assert_redirected_to camp_registration_path(assigns(:camp_registration))
  end

  test "should destroy camp_registration" do
    assert_difference('CampRegistration.count', -1) do
      delete :destroy, :id => @camp_registration.to_param
    end

    assert_redirected_to camp_registrations_path
  end
end
