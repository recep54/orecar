require "application_system_test_case"

class JapansTest < ApplicationSystemTestCase
  setup do
    @japan = japans(:one)
  end

  test "visiting the index" do
    visit japans_url
    assert_selector "h1", text: "Japans"
  end

  test "creating a Japan" do
    visit japans_url
    click_on "New Japan"

    click_on "Create Japan"

    assert_text "Japan was successfully created"
    click_on "Back"
  end

  test "updating a Japan" do
    visit japans_url
    click_on "Edit", match: :first

    click_on "Update Japan"

    assert_text "Japan was successfully updated"
    click_on "Back"
  end

  test "destroying a Japan" do
    visit japans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Japan was successfully destroyed"
  end
end
