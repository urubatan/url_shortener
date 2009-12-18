require 'test_helper'

class UrlInfosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:url_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create url_info" do
    assert_difference('UrlInfo.count') do
      post :create, :url_info => { }
    end

    assert_redirected_to url_info_path(assigns(:url_info))
  end

  test "should show url_info" do
    get :show, :id => url_infos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => url_infos(:one).to_param
    assert_response :success
  end

  test "should update url_info" do
    put :update, :id => url_infos(:one).to_param, :url_info => { }
    assert_redirected_to url_info_path(assigns(:url_info))
  end

  test "should destroy url_info" do
    assert_difference('UrlInfo.count', -1) do
      delete :destroy, :id => url_infos(:one).to_param
    end

    assert_redirected_to url_infos_path
  end
end
