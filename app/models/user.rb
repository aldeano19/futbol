class User < ApplicationRecord

  has_many :player_team_rs, foreign_key: "user_id"

  has_many :statistics

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def owns?(team)
    return !Team.find_by(created_by_id: id, id: team.id).nil?
  end

  def get_stat_total(type, game_id=nil)
    if game_id
      stats = statistics.where(stat_type: type, game_id: game_id).to_a
    else
      stats = statistics.where(stat_type: type).to_a
    end

    total = 0
    stats.each do |stat|
      total += stat.total
    end

    total
  end
end
