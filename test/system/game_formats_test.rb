require "application_system_test_case"

class GameFormatsTest < ApplicationSystemTestCase
  setup do
    @game_format = game_formats(:one)
  end

  test "visiting the index" do
    visit game_formats_url
    assert_selector "h1", text: "Game Formats"
  end

  test "creating a Game format" do
    visit game_formats_url
    click_on "New Game Format"

    fill_in "Half Time", with: @game_format.half_time
    fill_in "Max Players", with: @game_format.max_players
    fill_in "Min Players", with: @game_format.min_players
    fill_in "Name", with: @game_format.name
    click_on "Create Game format"

    assert_text "Game format was successfully created"
    click_on "Back"
  end

  test "updating a Game format" do
    visit game_formats_url
    click_on "Edit", match: :first

    fill_in "Half Time", with: @game_format.half_time
    fill_in "Max Players", with: @game_format.max_players
    fill_in "Min Players", with: @game_format.min_players
    fill_in "Name", with: @game_format.name
    click_on "Update Game format"

    assert_text "Game format was successfully updated"
    click_on "Back"
  end

  test "destroying a Game format" do
    visit game_formats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game format was successfully destroyed"
  end
end
