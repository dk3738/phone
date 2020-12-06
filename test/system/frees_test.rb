require "application_system_test_case"

class FreesTest < ApplicationSystemTestCase
  setup do
    @free = frees(:one)
  end

  test "visiting the index" do
    visit frees_url
    assert_selector "h1", text: "Frees"
  end

  test "creating a Free" do
    visit frees_url
    click_on "New Free"

    fill_in "Description", with: @free.description
    fill_in "Title", with: @free.title
    fill_in "User", with: @free.user_id
    fill_in "View count", with: @free.view_count
    click_on "Create Free"

    assert_text "Free was successfully created"
    click_on "Back"
  end

  test "updating a Free" do
    visit frees_url
    click_on "Edit", match: :first

    fill_in "Description", with: @free.description
    fill_in "Title", with: @free.title
    fill_in "User", with: @free.user_id
    fill_in "View count", with: @free.view_count
    click_on "Update Free"

    assert_text "Free was successfully updated"
    click_on "Back"
  end

  test "destroying a Free" do
    visit frees_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Free was successfully destroyed"
  end
end
