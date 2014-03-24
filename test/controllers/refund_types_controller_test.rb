require 'test_helper'

class RefundTypesControllerTest < ActionController::TestCase
  setup do
    @refund_type = refund_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:refund_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create refund_type" do
    assert_difference('RefundType.count') do
      post :create, refund_type: { name: @refund_type.name }
    end

    assert_redirected_to refund_type_path(assigns(:refund_type))
  end

  test "should show refund_type" do
    get :show, id: @refund_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @refund_type
    assert_response :success
  end

  test "should update refund_type" do
    patch :update, id: @refund_type, refund_type: { name: @refund_type.name }
    assert_redirected_to refund_type_path(assigns(:refund_type))
  end

  test "should destroy refund_type" do
    assert_difference('RefundType.count', -1) do
      delete :destroy, id: @refund_type
    end

    assert_redirected_to refund_types_path
  end
end
