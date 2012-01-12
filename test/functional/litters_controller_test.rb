require 'test_helper'

class LittersControllerTest < ActionController::TestCase
  setup do
    @litter = litters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:litters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create litter" do
    assert_difference('Litter.count') do
      post :create, :litter => @litter.attributes
    end

    assert_redirected_to litter_path(assigns(:litter))
  end

  test "should show litter" do
    get :show, :id => @litter.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @litter.to_param
    assert_response :success
  end

  test "should update litter" do
    put :update, :id => @litter.to_param, :litter => @litter.attributes
    assert_redirected_to litter_path(assigns(:litter))
  end

  test "should destroy litter" do
    assert_difference('Litter.count', -1) do
      delete :destroy, :id => @litter.to_param
    end

    assert_redirected_to litters_path
  end
end
