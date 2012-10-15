require 'test_helper'

class MibsControllerTest < ActionController::TestCase
  setup do
    @mib = mibs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mibs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mib" do
    assert_difference('Mib.count') do
      post :create, mib: { name: @mib.name, oid: @mib.oid }
    end

    assert_redirected_to mib_path(assigns(:mib))
  end

  test "should show mib" do
    get :show, id: @mib
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mib
    assert_response :success
  end

  test "should update mib" do
    put :update, id: @mib, mib: { name: @mib.name, oid: @mib.oid }
    assert_redirected_to mib_path(assigns(:mib))
  end

  test "should destroy mib" do
    assert_difference('Mib.count', -1) do
      delete :destroy, id: @mib
    end

    assert_redirected_to mibs_path
  end
end
