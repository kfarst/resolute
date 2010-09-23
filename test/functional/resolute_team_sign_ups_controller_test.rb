require 'test_helper'

class ResoluteTeamSignUpsControllerTest < ActionController::TestCase
  setup do
    @resolute_team_sign_up = resolute_team_sign_ups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resolute_team_sign_ups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resolute_team_sign_up" do
    assert_difference('ResoluteTeamSignUp.count') do
      post :create, :resolute_team_sign_up => @resolute_team_sign_up.attributes
    end

    assert_redirected_to resolute_team_sign_up_path(assigns(:resolute_team_sign_up))
  end

  test "should show resolute_team_sign_up" do
    get :show, :id => @resolute_team_sign_up.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @resolute_team_sign_up.to_param
    assert_response :success
  end

  test "should update resolute_team_sign_up" do
    put :update, :id => @resolute_team_sign_up.to_param, :resolute_team_sign_up => @resolute_team_sign_up.attributes
    assert_redirected_to resolute_team_sign_up_path(assigns(:resolute_team_sign_up))
  end

  test "should destroy resolute_team_sign_up" do
    assert_difference('ResoluteTeamSignUp.count', -1) do
      delete :destroy, :id => @resolute_team_sign_up.to_param
    end

    assert_redirected_to resolute_team_sign_ups_path
  end
end
