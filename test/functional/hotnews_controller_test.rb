require 'test_helper'

class HotnewsControllerTest < ActionController::TestCase
  setup do
    @hotnews = hotnews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotnews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotnews" do
    assert_difference('Hotnews.count') do
      post :create, hotnews: { title: @hotnews.title }
    end

    assert_redirected_to hotnews_path(assigns(:hotnews))
  end

  test "should show hotnews" do
    get :show, id: @hotnews
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotnews
    assert_response :success
  end

  test "should update hotnews" do
    put :update, id: @hotnews, hotnews: { title: @hotnews.title }
    assert_redirected_to hotnews_path(assigns(:hotnews))
  end

  test "should destroy hotnews" do
    assert_difference('Hotnews.count', -1) do
      delete :destroy, id: @hotnews
    end

    assert_redirected_to hotnews_index_path
  end
end
