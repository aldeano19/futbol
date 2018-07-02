class PagesController < ApplicationController
  include TeamsHelper
  include GamesHelper

  def index;
    @user = current_user
    @url = "localhost:3000"

    # UserMailer.welcome_email(current_user).deliver

    if user_signed_in?
      @next_game = get_next_game_for_user(current_user)
      @teams = get_teams_for_user(current_user)
      @games = get_all_games_for_user(current_user)

    else
      @games = Game.all
    end
  end

end
