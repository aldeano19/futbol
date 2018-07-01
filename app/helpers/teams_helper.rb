module TeamsHelper
  def get_teams_for_user(user)
    team_ids = user.player_team_rs.pluck(:team_id)
    Team.where(id: team_ids)
  end
end
