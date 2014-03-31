require 'test_helper'

class SessionOperationsControllerTest < ActionController::TestCase
  setup do
    @session_operation = session_operations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:session_operations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session_operation" do
    assert_difference('SessionOperation.count') do
      post :create, session_operation: { name: @session_operation.name, name_en: @session_operation.name_en }
    end

    assert_redirected_to session_operation_path(assigns(:session_operation))
  end

  test "should show session_operation" do
    get :show, id: @session_operation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @session_operation
    assert_response :success
  end

  test "should update session_operation" do
    patch :update, id: @session_operation, session_operation: { name: @session_operation.name, name_en: @session_operation.name_en }
    assert_redirected_to session_operation_path(assigns(:session_operation))
  end

  test "should destroy session_operation" do
    assert_difference('SessionOperation.count', -1) do
      delete :destroy, id: @session_operation
    end

    assert_redirected_to session_operations_path
  end
end
