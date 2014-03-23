require 'test_helper'

class BankCardTypesControllerTest < ActionController::TestCase
  setup do
    @bank_card_type = bank_card_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bank_card_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bank_card_type" do
    assert_difference('BankCardType.count') do
      post :create, bank_card_type: { name: @bank_card_type.name }
    end

    assert_redirected_to bank_card_type_path(assigns(:bank_card_type))
  end

  test "should show bank_card_type" do
    get :show, id: @bank_card_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bank_card_type
    assert_response :success
  end

  test "should update bank_card_type" do
    patch :update, id: @bank_card_type, bank_card_type: { name: @bank_card_type.name }
    assert_redirected_to bank_card_type_path(assigns(:bank_card_type))
  end

  test "should destroy bank_card_type" do
    assert_difference('BankCardType.count', -1) do
      delete :destroy, id: @bank_card_type
    end

    assert_redirected_to bank_card_types_path
  end
end
