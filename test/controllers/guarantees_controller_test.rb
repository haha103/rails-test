require 'test_helper'

class GuaranteesControllerTest < ActionController::TestCase
  setup do
    @guarantee = guarantees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guarantees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guarantee" do
    assert_difference('Guarantee.count') do
      post :create, guarantee: { letter_code: @guarantee.letter_code, letter_scan: @guarantee.letter_scan }
    end

    assert_redirected_to guarantee_path(assigns(:guarantee))
  end

  test "should show guarantee" do
    get :show, id: @guarantee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guarantee
    assert_response :success
  end

  test "should update guarantee" do
    patch :update, id: @guarantee, guarantee: { letter_code: @guarantee.letter_code, letter_scan: @guarantee.letter_scan }
    assert_redirected_to guarantee_path(assigns(:guarantee))
  end

  test "should destroy guarantee" do
    assert_difference('Guarantee.count', -1) do
      delete :destroy, id: @guarantee
    end

    assert_redirected_to guarantees_path
  end
end
