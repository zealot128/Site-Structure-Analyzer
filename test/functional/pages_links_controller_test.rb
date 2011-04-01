require 'test_helper'

class PagesLinksControllerTest < ActionController::TestCase
  setup do
    @pages_link = pages_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pages_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pages_link" do
    assert_difference('PagesLink.count') do
      post :create, :pages_link => @pages_link.attributes
    end

    assert_redirected_to pages_link_path(assigns(:pages_link))
  end

  test "should show pages_link" do
    get :show, :id => @pages_link.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pages_link.to_param
    assert_response :success
  end

  test "should update pages_link" do
    put :update, :id => @pages_link.to_param, :pages_link => @pages_link.attributes
    assert_redirected_to pages_link_path(assigns(:pages_link))
  end

  test "should destroy pages_link" do
    assert_difference('PagesLink.count', -1) do
      delete :destroy, :id => @pages_link.to_param
    end

    assert_redirected_to pages_links_path
  end
end
