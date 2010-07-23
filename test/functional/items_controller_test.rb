require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
    setup do
      @page = Factory(:page)
      @category = Factory(:category)
    end

    teardown do
      @page.destroy
      @category.destroy
    end

    test "should get index for page" do
      get :index, :type => "page"
      assert_response :success
      assert_not_nil assigns(:items)
    end

    test "should get new page" do
      get :new, :type => "page" 
      assert_response :success
    end

    test "should create page" do
      assert_difference('Item.count') do
        post :create, :item => @page.attributes
      end

      assert_redirected_to item_path(assigns(:item))
    end

    test "should show page" do
      get :show, :id => @page.to_param
      assert_response :success
    end

    test "should get edit page" do
      get :edit, :id => @page.to_param
      assert_response :success
    end

    test "should update page" do
      put :update, :id => @page.to_param, :item => @page.attributes
      assert_redirected_to item_path(assigns(:item))
    end

    test "should destroy page" do
      assert_difference('Item.count', -1) do
        delete :destroy, :id => @page.to_param
      end

      assert_redirected_to items_path
    end

    test "should get index for category" do
      get :index, :type => "category" 
      assert_response :success
      assert_not_nil assigns(:items)
    end

    test "should get new category" do
      get :new, :type => "category" 
      assert_response :success
    end

    test "should create category" do
      assert_difference('Item.count') do
        post :create, :item => @category.attributes
      end

      assert_redirected_to item_path(assigns(:item))
    end

    test "should show category" do
      get :show, :id => @category.to_param
      assert_response :success
    end

    test "should get edit category" do
      get :edit, :id => @category.to_param
      assert_response :success
    end

    test "should update category" do
      put :update, :id => @category.to_param, :item => @category.attributes
      assert_redirected_to item_path(assigns(:item))
    end

    test "should destroy category" do
      assert_difference('Item.count', -1) do
        delete :destroy, :id => @category.to_param
      end

      assert_redirected_to items_path
    end
end
