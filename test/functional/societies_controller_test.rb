require 'test_helper'

class SocietiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:societies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create society" do
    assert_difference('Society.count') do
      post :create, :society => { }
    end

    assert_redirected_to society_path(assigns(:society))
  end

  test "should show society" do
    get :show, :id => societies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => societies(:one).to_param
    assert_response :success
  end

  test "should update society" do
    put :update, :id => societies(:one).to_param, :society => { }
    assert_redirected_to society_path(assigns(:society))
  end

  test "should destroy society" do
    assert_difference('Society.count', -1) do
      delete :destroy, :id => societies(:one).to_param
    end

    assert_redirected_to societies_path
  end
end
