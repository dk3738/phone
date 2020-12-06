require 'test_helper'

class ReviewcommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reviewcomment = reviewcomments(:one)
  end

  test "should get index" do
    get reviewcomments_url
    assert_response :success
  end

  test "should get new" do
    get new_reviewcomment_url
    assert_response :success
  end

  test "should create reviewcomment" do
    assert_difference('Reviewcomment.count') do
      post reviewcomments_url, params: { reviewcomment: { content: @reviewcomment.content, review_id: @reviewcomment.review_id, user_id: @reviewcomment.user_id } }
    end

    assert_redirected_to reviewcomment_url(Reviewcomment.last)
  end

  test "should show reviewcomment" do
    get reviewcomment_url(@reviewcomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_reviewcomment_url(@reviewcomment)
    assert_response :success
  end

  test "should update reviewcomment" do
    patch reviewcomment_url(@reviewcomment), params: { reviewcomment: { content: @reviewcomment.content, review_id: @reviewcomment.review_id, user_id: @reviewcomment.user_id } }
    assert_redirected_to reviewcomment_url(@reviewcomment)
  end

  test "should destroy reviewcomment" do
    assert_difference('Reviewcomment.count', -1) do
      delete reviewcomment_url(@reviewcomment)
    end

    assert_redirected_to reviewcomments_url
  end
end
