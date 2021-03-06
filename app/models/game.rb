class Game < ApplicationRecord
  belongs_to :team_a, class_name: "Team"
  belongs_to :team_b, class_name: "Team"
  belongs_to :game_format
  belongs_to :game_master, class_name: "User"

  has_many :statistics
end
