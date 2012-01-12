require 'test_helper'

class SupportClientsControllerTest < ActionController::TestCase
  setup do
    @support_client = support_clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:support_clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create support_client" do
    assert_difference('SupportClient.count') do
      post :create, :support_client => @support_client.attributes
    end

    assert_redirected_to support_client_path(assigns(:support_client))
  end

  test "should show support_client" do
    get :show, :id => @support_client.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @support_client.to_param
    assert_response :success
  end

  test "should update support_client" do
    put :update, :id => @support_client.to_param, :support_client => @support_client.attributes
    assert_redirected_to support_client_path(assigns(:support_client))
  end

  test "should destroy support_client" do
    assert_difference('SupportClient.count', -1) do
      delete :destroy, :id => @support_client.to_param
    end

    assert_redirected_to support_clients_path
  end
end
