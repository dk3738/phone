require "application_system_test_case"

class SharecommentsTest < ApplicationSystemTestCase
  setup do
    @sharecomment = sharecomments(:one)
  end

  test "visiting the index" do
    visit sharecomments_url
    assert_selector "h1", text: "Sharecomments"
  end

  test "creating a Sharecomment" do
    visit sharecomments_url
    click_on "New Sharecomment"

    fill_in "Content", with: @sharecomment.content
    fill_in "Share", with: @sharecomment.share_id
    fill_in "User", with: @sharecomment.user_id
    click_on "Create Sharecomment"

    assert_text "Sharecomment was successfully created"
    click_on "Back"
  end

  test "updating a Sharecomment" do
    visit sharecomments_url
    click_on "Edit", match: :first

    fill_in "Content", with: @sharecomment.content
    fill_in "Share", with: @sharecomment.share_id
    fill_in "User", with: @sharecomment.user_id
    click_on "Update Sharecomment"

    assert_text "Sharecomment was successfully updated"
    click_on "Back"
  end

  test "destroying a Sharecomment" do
    visit sharecomments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sharecomment was successfully destroyed"
  end
end
