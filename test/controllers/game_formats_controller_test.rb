require 'test_helper'

class GameFormatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_format = game_formats(:one)
  end

  test "should get index" do
    get game_formats_url
    assert_response :success
  end

  test "should get new" do
    get new_game_format_url
    assert_response :success
  end

  test "should create game_format" do
    assert_difference('GameFormat.count') do
      post game_formats_url, params: { game_format: { half_time: @game_format.half_time, max_players: @game_format.max_players, min_players: @game_format.min_players, name: @game_format.name } }
    end

    assert_redirected_to game_format_url(GameFormat.last)
  end

  test "should show game_format" do
    get game_format_url(@game_format)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_format_url(@game_format)
    assert_response :success
  end

  test "should update game_format" do
    patch game_format_url(@game_format), params: { game_format: { half_time: @game_format.half_time, max_players: @game_format.max_players, min_players: @game_format.min_players, name: @game_format.name } }
    assert_redirected_to game_format_url(@game_format)
  end

  test "should destroy game_format" do
    assert_difference('GameFormat.count', -1) do
      delete game_format_url(@game_format)
    end

    assert_redirected_to game_formats_url
  end
end
