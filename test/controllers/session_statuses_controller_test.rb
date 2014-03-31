require 'test_helper'

class SessionStatusesControllerTest < ActionController::TestCase
  setup do
    @session_status = session_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:session_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session_status" do
    assert_difference('SessionStatus.count') do
      post :create, session_status: { code: @session_status.code, name: @session_status.name }
    end

    assert_redirected_to session_status_path(assigns(:session_status))
  end

  test "should show session_status" do
    get :show, id: @session_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @session_status
    assert_response :success
  end

  test "should update session_status" do
    patch :update, id: @session_status, session_status: { code: @session_status.code, name: @session_status.name }
    assert_redirected_to session_status_path(assigns(:session_status))
  end

  test "should destroy session_status" do
    assert_difference('SessionStatus.count', -1) do
      delete :destroy, id: @session_status
    end

    assert_redirected_to session_statuses_path
  end
end
