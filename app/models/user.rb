class User < ApplicationRecord

  has_many :player_team_rs, foreign_key: "user_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def owns?(team)
    return !Team.find_by(created_by_id: id, id: team.id).nil?
  end
end
