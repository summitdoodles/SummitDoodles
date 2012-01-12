require 'test_helper'

class WeightReportsControllerTest < ActionController::TestCase
  setup do
    @weight_report = weight_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weight_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weight_report" do
    assert_difference('WeightReport.count') do
      post :create, :weight_report => @weight_report.attributes
    end

    assert_redirected_to weight_report_path(assigns(:weight_report))
  end

  test "should show weight_report" do
    get :show, :id => @weight_report.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @weight_report.to_param
    assert_response :success
  end

  test "should update weight_report" do
    put :update, :id => @weight_report.to_param, :weight_report => @weight_report.attributes
    assert_redirected_to weight_report_path(assigns(:weight_report))
  end

  test "should destroy weight_report" do
    assert_difference('WeightReport.count', -1) do
      delete :destroy, :id => @weight_report.to_param
    end

    assert_redirected_to weight_reports_path
  end
end
