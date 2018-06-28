class User < ApplicationRecord
  has_many :teams
  has_many :player_team_rs, foreign_key: "user_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
