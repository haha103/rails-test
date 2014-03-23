require 'test_helper'

class BankBranchesControllerTest < ActionController::TestCase
  setup do
    @bank_branch = bank_branches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bank_branches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bank_branch" do
    assert_difference('BankBranch.count') do
      post :create, bank_branch: { name: @bank_branch.name }
    end

    assert_redirected_to bank_branch_path(assigns(:bank_branch))
  end

  test "should show bank_branch" do
    get :show, id: @bank_branch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bank_branch
    assert_response :success
  end

  test "should update bank_branch" do
    patch :update, id: @bank_branch, bank_branch: { name: @bank_branch.name }
    assert_redirected_to bank_branch_path(assigns(:bank_branch))
  end

  test "should destroy bank_branch" do
    assert_difference('BankBranch.count', -1) do
      delete :destroy, id: @bank_branch
    end

    assert_redirected_to bank_branches_path
  end
end
