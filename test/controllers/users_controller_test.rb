require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { additional_phone: @user.additional_phone, addr_city: @user.addr_city, addr_country: @user.addr_country, addr_details: @user.addr_details, addr_province: @user.addr_province, admin: @user.admin, bankaccount_binded: @user.bankaccount_binded, email_activated: @user.email_activated, id_card: @user.id_card, mobile: @user.mobile, mobile_activated: @user.mobile_activated, name: @user.name, user_name: @user.user_name }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { additional_phone: @user.additional_phone, addr_city: @user.addr_city, addr_country: @user.addr_country, addr_details: @user.addr_details, addr_province: @user.addr_province, admin: @user.admin, bankaccount_binded: @user.bankaccount_binded, email_activated: @user.email_activated, id_card: @user.id_card, mobile: @user.mobile, mobile_activated: @user.mobile_activated, name: @user.name, user_name: @user.user_name }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
