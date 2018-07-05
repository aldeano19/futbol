class GameTeamPlayer

  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :scheduled_date, :where, :game_format, :game_master, :team_a_name, :team_b_name, :team_a_name_list, :team_a_phone_list, :team_b_name_list, :team_b_phone_list

  validates :scheduled_date, :presence => true
  validates :where, :presence => true
  validates :game_format, :presence => true
  validates :game_master, :presence => true
  validates :team_a_name, :presence => true
  validates :team_b_name, :presence => true
  validates :team_a_name_list, :presence => true
  validates :team_a_phone_list, :presence => true
  validates :team_b_name_list, :presence => true
  validates :team_b_phone_list, :presence => true

  def save!
    team_a = Team.new name: team_a_name
    team_b = Team.new name: team_b_name
    team_a.save!
    team_b.save!


    team_a_users = []
    (0..@team_a_name_list.length).each do |index|
      user = User.new phone: team_a_phone_list[index], name: team_a_name_list[index], password: "q1w2e3", password_confirmation: "q1w2e3"
      user.save!

      relationship = user.player_team_rs.build(team_id: team_a.id)
      relationship.save!

      team_a_users.push(user);
    end

    team_b_users = []
    (0..team_b_name_list.length).each do |index|
      user = User.new phone: team_b_phone_list[index], name: team_b_name_list[index], password: "q1w2e3", password_confirmation: "q1w2e3"
      user.save!

      relationship = user.player_team_rs.build(team_id: team_b.id)
      relationship.save!

      team_b_users.push(user);
    end

    master = team_a_users[0]

    # Returns the newly created game
    game =  Game.new(game_master_id: master.id, scheduled_date: @scheduled_date, where: where, team_a_id: team_a.id, team_b_id: team_b.id, game_format_id: game_format)

    game.save!
    game
  end

end