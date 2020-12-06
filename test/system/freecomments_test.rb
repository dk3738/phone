require "application_system_test_case"

class FreecommentsTest < ApplicationSystemTestCase
  setup do
    @freecomment = freecomments(:one)
  end

  test "visiting the index" do
    visit freecomments_url
    assert_selector "h1", text: "Freecomments"
  end

  test "creating a Freecomment" do
    visit freecomments_url
    click_on "New Freecomment"

    fill_in "Body", with: @freecomment.body
    fill_in "Free", with: @freecomment.free_id
    fill_in "User", with: @freecomment.user_id
    click_on "Create Freecomment"

    assert_text "Freecomment was successfully created"
    click_on "Back"
  end

  test "updating a Freecomment" do
    visit freecomments_url
    click_on "Edit", match: :first

    fill_in "Body", with: @freecomment.body
    fill_in "Free", with: @freecomment.free_id
    fill_in "User", with: @freecomment.user_id
    click_on "Update Freecomment"

    assert_text "Freecomment was successfully updated"
    click_on "Back"
  end

  test "destroying a Freecomment" do
    visit freecomments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Freecomment was successfully destroyed"
  end
end
