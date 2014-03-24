require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { interest_investor: @product.interest_investor, interest_platform: @product.interest_platform, invest_end: @product.invest_end, invest_start: @product.invest_start, purpose_detail: @product.purpose_detail, purpose_summary: @product.purpose_summary, refund_date: @product.refund_date, target_amount: @product.target_amount, target_amount_min: @product.target_amount_min }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { interest_investor: @product.interest_investor, interest_platform: @product.interest_platform, invest_end: @product.invest_end, invest_start: @product.invest_start, purpose_detail: @product.purpose_detail, purpose_summary: @product.purpose_summary, refund_date: @product.refund_date, target_amount: @product.target_amount, target_amount_min: @product.target_amount_min }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
