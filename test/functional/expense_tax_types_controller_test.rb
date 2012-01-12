require 'test_helper'

class ExpenseTaxTypesControllerTest < ActionController::TestCase
  setup do
    @expense_tax_type = expense_tax_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expense_tax_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expense_tax_type" do
    assert_difference('ExpenseTaxType.count') do
      post :create, :expense_tax_type => @expense_tax_type.attributes
    end

    assert_redirected_to expense_tax_type_path(assigns(:expense_tax_type))
  end

  test "should show expense_tax_type" do
    get :show, :id => @expense_tax_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @expense_tax_type.to_param
    assert_response :success
  end

  test "should update expense_tax_type" do
    put :update, :id => @expense_tax_type.to_param, :expense_tax_type => @expense_tax_type.attributes
    assert_redirected_to expense_tax_type_path(assigns(:expense_tax_type))
  end

  test "should destroy expense_tax_type" do
    assert_difference('ExpenseTaxType.count', -1) do
      delete :destroy, :id => @expense_tax_type.to_param
    end

    assert_redirected_to expense_tax_types_path
  end
end
