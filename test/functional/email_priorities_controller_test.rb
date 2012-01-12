require 'test_helper'

class EmailPrioritiesControllerTest < ActionController::TestCase
  setup do
    @email_priority = email_priorities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_priorities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_priority" do
    assert_difference('EmailPriority.count') do
      post :create, :email_priority => @email_priority.attributes
    end

    assert_redirected_to email_priority_path(assigns(:email_priority))
  end

  test "should show email_priority" do
    get :show, :id => @email_priority.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @email_priority.to_param
    assert_response :success
  end

  test "should update email_priority" do
    put :update, :id => @email_priority.to_param, :email_priority => @email_priority.attributes
    assert_redirected_to email_priority_path(assigns(:email_priority))
  end

  test "should destroy email_priority" do
    assert_difference('EmailPriority.count', -1) do
      delete :destroy, :id => @email_priority.to_param
    end

    assert_redirected_to email_priorities_path
  end
end
