require 'test_helper'

class OnlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @online = onlines(:one)
  end

  test "should get index" do
    get onlines_url
    assert_response :success
  end

  test "should get new" do
    get new_online_url
    assert_response :success
  end

  test "should create online" do
    assert_difference('Online.count') do
      post onlines_url, params: { online: { description: @online.description, title: @online.title, user_id: @online.user_id, view_count: @online.view_count } }
    end

    assert_redirected_to online_url(Online.last)
  end

  test "should show online" do
    get online_url(@online)
    assert_response :success
  end

  test "should get edit" do
    get edit_online_url(@online)
    assert_response :success
  end

  test "should update online" do
    patch online_url(@online), params: { online: { description: @online.description, title: @online.title, user_id: @online.user_id, view_count: @online.view_count } }
    assert_redirected_to online_url(@online)
  end

  test "should destroy online" do
    assert_difference('Online.count', -1) do
      delete online_url(@online)
    end

    assert_redirected_to onlines_url
  end
end
