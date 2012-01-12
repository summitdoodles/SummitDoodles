require 'test_helper'

class HeatCyclesControllerTest < ActionController::TestCase
  setup do
    @heat_cycle = heat_cycles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:heat_cycles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create heat_cycle" do
    assert_difference('HeatCycle.count') do
      post :create, :heat_cycle => @heat_cycle.attributes
    end

    assert_redirected_to heat_cycle_path(assigns(:heat_cycle))
  end

  test "should show heat_cycle" do
    get :show, :id => @heat_cycle.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @heat_cycle.to_param
    assert_response :success
  end

  test "should update heat_cycle" do
    put :update, :id => @heat_cycle.to_param, :heat_cycle => @heat_cycle.attributes
    assert_redirected_to heat_cycle_path(assigns(:heat_cycle))
  end

  test "should destroy heat_cycle" do
    assert_difference('HeatCycle.count', -1) do
      delete :destroy, :id => @heat_cycle.to_param
    end

    assert_redirected_to heat_cycles_path
  end
end
