class Game < ApplicationRecord
  belongs_to :teamA, class_name: "Team"
  belongs_to :teamB, class_name: "Team"
end
