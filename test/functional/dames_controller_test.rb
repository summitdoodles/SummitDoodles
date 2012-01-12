require 'test_helper'

class DamesControllerTest < ActionController::TestCase
  setup do
    @dame = dames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dame" do
    assert_difference('Dame.count') do
      post :create, :dame => @dame.attributes
    end

    assert_redirected_to dame_path(assigns(:dame))
  end

  test "should show dame" do
    get :show, :id => @dame.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @dame.to_param
    assert_response :success
  end

  test "should update dame" do
    put :update, :id => @dame.to_param, :dame => @dame.attributes
    assert_redirected_to dame_path(assigns(:dame))
  end

  test "should destroy dame" do
    assert_difference('Dame.count', -1) do
      delete :destroy, :id => @dame.to_param
    end

    assert_redirected_to dames_path
  end
end
