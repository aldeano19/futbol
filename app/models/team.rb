class Team < ApplicationRecord
  has_many :player_team_rs
  has_many :games

  def players
    User.find(player_team_rs.map(&:user_id))
  end
end
