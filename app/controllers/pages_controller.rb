class PagesController < ApplicationController
  # before_action :authenticate_user!

  def index;
    if user_signed_in?
      @next_game = Game.where("scheduled_date > ?", Date.today).order("scheduled_date").first

      team_ids = current_user.player_team_rs.pluck(:team_id)
      @teams = Team.where(id: team_ids)
    else
      team_ids = Team.all.pluck(:id)
    end
    @games = Game.where("team_a_id IN (?) OR team_b_id IN (?)", team_ids, team_ids).to_a
  end

end
