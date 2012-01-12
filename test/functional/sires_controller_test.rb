require 'test_helper'

class SiresControllerTest < ActionController::TestCase
  setup do
    @sire = sires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sire" do
    assert_difference('Sire.count') do
      post :create, :sire => @sire.attributes
    end

    assert_redirected_to sire_path(assigns(:sire))
  end

  test "should show sire" do
    get :show, :id => @sire.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sire.to_param
    assert_response :success
  end

  test "should update sire" do
    put :update, :id => @sire.to_param, :sire => @sire.attributes
    assert_redirected_to sire_path(assigns(:sire))
  end

  test "should destroy sire" do
    assert_difference('Sire.count', -1) do
      delete :destroy, :id => @sire.to_param
    end

    assert_redirected_to sires_path
  end
end
