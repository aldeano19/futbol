class Team < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'created_by_id'
  has_many :player_team_rs
end
