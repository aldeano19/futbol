class Statistic < ApplicationRecord
  belongs_to :user
  belongs_to :game

  enum types: [:goal, :assist]
end
