require 'test_helper'

class NewNotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get new_notifications_index_url
    assert_response :success
  end

  test "should get show" do
    get new_notifications_show_url
    assert_response :success
  end

  test "should get read_all" do
    get new_notifications_read_all_url
    assert_response :success
  end

end
