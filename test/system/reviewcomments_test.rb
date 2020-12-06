require "application_system_test_case"

class ReviewcommentsTest < ApplicationSystemTestCase
  setup do
    @reviewcomment = reviewcomments(:one)
  end

  test "visiting the index" do
    visit reviewcomments_url
    assert_selector "h1", text: "Reviewcomments"
  end

  test "creating a Reviewcomment" do
    visit reviewcomments_url
    click_on "New Reviewcomment"

    fill_in "Content", with: @reviewcomment.content
    fill_in "Review", with: @reviewcomment.review_id
    fill_in "User", with: @reviewcomment.user_id
    click_on "Create Reviewcomment"

    assert_text "Reviewcomment was successfully created"
    click_on "Back"
  end

  test "updating a Reviewcomment" do
    visit reviewcomments_url
    click_on "Edit", match: :first

    fill_in "Content", with: @reviewcomment.content
    fill_in "Review", with: @reviewcomment.review_id
    fill_in "User", with: @reviewcomment.user_id
    click_on "Update Reviewcomment"

    assert_text "Reviewcomment was successfully updated"
    click_on "Back"
  end

  test "destroying a Reviewcomment" do
    visit reviewcomments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reviewcomment was successfully destroyed"
  end
end
