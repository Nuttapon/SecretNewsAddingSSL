require 'test_helper'

class HotnewsReadsControllerTest < ActionController::TestCase
  setup do
    @hotnews_read = hotnews_reads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotnews_reads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotnews_read" do
    assert_difference('HotnewsRead.count') do
      post :create, hotnews_read: {  }
    end

    assert_redirected_to hotnews_read_path(assigns(:hotnews_read))
  end

  test "should show hotnews_read" do
    get :show, id: @hotnews_read
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotnews_read
    assert_response :success
  end

  test "should update hotnews_read" do
    put :update, id: @hotnews_read, hotnews_read: {  }
    assert_redirected_to hotnews_read_path(assigns(:hotnews_read))
  end

  test "should destroy hotnews_read" do
    assert_difference('HotnewsRead.count', -1) do
      delete :destroy, id: @hotnews_read
    end

    assert_redirected_to hotnews_reads_path
  end
end
