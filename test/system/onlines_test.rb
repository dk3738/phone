require "application_system_test_case"

class OnlinesTest < ApplicationSystemTestCase
  setup do
    @online = onlines(:one)
  end

  test "visiting the index" do
    visit onlines_url
    assert_selector "h1", text: "Onlines"
  end

  test "creating a Online" do
    visit onlines_url
    click_on "New Online"

    fill_in "Description", with: @online.description
    fill_in "Title", with: @online.title
    fill_in "User", with: @online.user_id
    fill_in "View count", with: @online.view_count
    click_on "Create Online"

    assert_text "Online was successfully created"
    click_on "Back"
  end

  test "updating a Online" do
    visit onlines_url
    click_on "Edit", match: :first

    fill_in "Description", with: @online.description
    fill_in "Title", with: @online.title
    fill_in "User", with: @online.user_id
    fill_in "View count", with: @online.view_count
    click_on "Update Online"

    assert_text "Online was successfully updated"
    click_on "Back"
  end

  test "destroying a Online" do
    visit onlines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Online was successfully destroyed"
  end
end
