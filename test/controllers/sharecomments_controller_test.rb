require 'test_helper'

class SharecommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sharecomment = sharecomments(:one)
  end

  test "should get index" do
    get sharecomments_url
    assert_response :success
  end

  test "should get new" do
    get new_sharecomment_url
    assert_response :success
  end

  test "should create sharecomment" do
    assert_difference('Sharecomment.count') do
      post sharecomments_url, params: { sharecomment: { content: @sharecomment.content, share_id: @sharecomment.share_id, user_id: @sharecomment.user_id } }
    end

    assert_redirected_to sharecomment_url(Sharecomment.last)
  end

  test "should show sharecomment" do
    get sharecomment_url(@sharecomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_sharecomment_url(@sharecomment)
    assert_response :success
  end

  test "should update sharecomment" do
    patch sharecomment_url(@sharecomment), params: { sharecomment: { content: @sharecomment.content, share_id: @sharecomment.share_id, user_id: @sharecomment.user_id } }
    assert_redirected_to sharecomment_url(@sharecomment)
  end

  test "should destroy sharecomment" do
    assert_difference('Sharecomment.count', -1) do
      delete sharecomment_url(@sharecomment)
    end

    assert_redirected_to sharecomments_url
  end
end
