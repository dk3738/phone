require 'test_helper'

class FreecommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @freecomment = freecomments(:one)
  end

  test "should get index" do
    get freecomments_url
    assert_response :success
  end

  test "should get new" do
    get new_freecomment_url
    assert_response :success
  end

  test "should create freecomment" do
    assert_difference('Freecomment.count') do
      post freecomments_url, params: { freecomment: { body: @freecomment.body, free_id: @freecomment.free_id, user_id: @freecomment.user_id } }
    end

    assert_redirected_to freecomment_url(Freecomment.last)
  end

  test "should show freecomment" do
    get freecomment_url(@freecomment)
    assert_response :success
  end

  test "should get edit" do
    get edit_freecomment_url(@freecomment)
    assert_response :success
  end

  test "should update freecomment" do
    patch freecomment_url(@freecomment), params: { freecomment: { body: @freecomment.body, free_id: @freecomment.free_id, user_id: @freecomment.user_id } }
    assert_redirected_to freecomment_url(@freecomment)
  end

  test "should destroy freecomment" do
    assert_difference('Freecomment.count', -1) do
      delete freecomment_url(@freecomment)
    end

    assert_redirected_to freecomments_url
  end
end
