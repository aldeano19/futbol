module GamesHelper

  # Get teams related to the user
  # Get games related to those teams
  def get_all_games_for_user(user)
    team_ids = PlayerTeamR.where(user_id: user.id).pluck(:team_id)

    Game.where("team_a_id IN (?) OR team_b_id IN (?)", team_ids, team_ids).to_a
  end


  def get_next_game_for_user(user)
    team_ids = PlayerTeamR.where(user_id: user.id).pluck(:team_id)

    Game.where("(team_a_id IN (?) OR team_b_id IN (?)) AND (scheduled_date > ?)", team_ids, team_ids, Date.today).order("scheduled_date").first
  end


end
